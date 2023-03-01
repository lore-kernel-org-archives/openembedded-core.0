Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A34C87FE2
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24022.1677681914663645025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mlv81XfQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101869da27179-b692e537-c43c-4846-a1c3-8a48c3df6124-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ijkaAh/f1yWD0U94EB5hqF8jVrST7xSM1WlojfQrhn4=;
	b=mlv81XfQ8zALiQNG1r2FG/tIUO05M8mXlmtiU5tp9Ea3HynJSiO/66vOS88f9TGb
	KbSNfd5izMO2qvG1IdF+xIk0+neO4QCaTkcwkpwe2WWqdZdG+ohC02B5mq3RumOnkMc
	V/cjh5Jw7qoGDToNVyFGOMOweuDFatsLTcvhLHJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ijkaAh/f1yWD0U94EB5hqF8jVrST7xSM1WlojfQrhn4=;
	b=Ak0INfGCH72EIL0azz3Ir29alnwnDIYtFocbXjlcqKNK8sB2h9v6b/UqQC0S6uD9
	QIJD3R6BuGfEzhskR+eQUjvcBxB7C+9DASOqM50oTRCHyenJJAK11dsH+Aac9Qs5cW4
	znPH2Ils8X7LKDJZKKqJsMxAyG/KSnu7dN21RL4k=
Content-Type: multipart/mixed; boundary="===============7537041586640472792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.2 SUCCEEDED
Message-ID: <010101869da27179-b692e537-c43c-4846-a1c3-8a48c3df6124-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177914

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-6.1-6.2.patch
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
--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 13 Mirrors 0 Missed 77 Current 418 (14% match, 84% complete)
Removing 23 stale sstate objects for arch core2-64...done.
Removing 14 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 508 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 875 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: recipe meson-native-1.0.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/make/4.4-r0/temp/log.do_packagedata_setscene.1596699
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 1002 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1039 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1040 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1062 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1068 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1259 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1270 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1271 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 1304 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1373 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1374 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1375 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1397 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1401 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1419 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_fetch)
NOTE: recipe make-4.4-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: Running task 1540 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe strace-6.2-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1632 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1633 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1635 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1636 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1637 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1638 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: Running task 1640 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 1644 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1645 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1646 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1647 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1648 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1649 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1650 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1660 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1661 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c345f6a217af5358c1ba08e9736210fba6decfc2bb8c2d72006c0ecd5c669071
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1667 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1670 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe strace-6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1671 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_patch)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1672 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe strace-6.2-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1673 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1675 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1676 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1677 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe strace-6.2-r0: task do_patch: Succeeded
NOTE: Running task 1678 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1679 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a2ffcc996d332fc811cbcfa9d450bc46756f44756a1a31643378580d2d3f8de
NOTE: Running task 1683 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1684 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1686 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.2-r0: task do_populate_lic: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe strace-6.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1687 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic unihash changed to 02fa31cc1e7453197a6d88073ae8bece9b02f92461ad0f94dd82bf1c809e1798
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: Running task 1689 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1690 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: Running task 1691 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1692 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1693 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: Running task 1696 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1697 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot unihash changed to c107804dddc7220fde6a965f7bcc96e01987254e49249294cb9ce5f38bef3e23
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 492 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot unihash changed to 98f570443932b11f745c9dea40c5e25b509d4de0d65a014c7f4281477115eb2e
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1698 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 1699 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package unihash changed to dfe85beb5fc580098657fff6d9fd91bda10dfbc5cb9ead0585f9b92610e841ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata became valid
NOTE: Running setscene task 494 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1712 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot unihash changed to 73e6d4ef2c21f6c19d0a3d09b9d4e26ad294cbfbe73eec938edfe80aec81dcef
NOTE: Setscene tasks completed
NOTE: Running task 1746 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package unihash changed to a9ce584f9437b7b6e7488537d89ed9cafc05cf7f5b32070144e9d5e385da66b9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to c1ad32474df0827e43cd1d570b66d56754bd0f032cf2961c270ea9dcbb5e73e4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1750 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to a55bcf8ad3b9622a0a42a87d5ca4fe9ca56c9036fbfb5888ed8384b031dfa3cb
NOTE: Setscene tasks completed
NOTE: Running task 1754 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1755 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to b75dabde2752691e65dd86f89d15f136177a3d401449bbd9dc047ea3d644db55
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1759 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1761 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_compile)
NOTE: recipe systemd-1_252.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1765 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1766 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1767 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1768 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1769 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1771 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 1773 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_compile: Succeeded
NOTE: Running task 1774 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe systemd-1_252.5-r0: task do_install: Succeeded
NOTE: Running task 1776 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot)
NOTE: Running task 1777 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1778 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1779 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 1780 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot unihash changed to 7b940dd0519ee8eac2eb37d74b33ab92dc777ebad722825a6ee0b7c9a7b4555e
NOTE: Setscene tasks completed
NOTE: Running task 1781 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1784 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1785 tasks of which 1676 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata
Summary: There were 148 ERROR messages, returning a non-zero exit code.
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-src went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dbg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-staticdev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-doc went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-be went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-bg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-cs went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-da went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-de went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-es went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ga went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-gl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-he went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-hr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-id went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-it went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ja went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ko went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-lt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-nl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt-br went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ro went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ru went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sv went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-tr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-uk went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-vi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-cn went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-tw went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.74.5-r0/temp/log.do_packagedata.1675467
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata) failed with exit code '1'

--===============7537041586640472792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-strace-upgrade-6.1-6.2.patch"

RnJvbSAyZjJiMmQ1MWJmYTZmY2U2ZjhkNjM3NmYwM2EzOTYyNGNmMDUzOWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODo0OTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmFjZTogdXBncmFkZSA2LjEgLT4gNi4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJh
Y2Uve3N0cmFjZV82LjEuYmIgPT4gc3RyYWNlXzYuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3tzdHJhY2VfNi4xLmJiID0+IHN0cmFjZV82LjIuYmJ9ICg5NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4yLmJiCmlu
ZGV4IGVjNWMxMGM4MGQuLmRjMDFiNTdkODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdHJhY2Uvc3RyYWNlXzYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3Ry
YWNlL3N0cmFjZV82LjIuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3N0
cmFjZS5pby9maWxlcy8ke1BWfS9zdHJhY2UtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29uZi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxl
LXN1cC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRf
dC13aXRoLW9mZl90LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjI1NzllOWNlYzM3ZGJiNzg2ZjZlYTBiZWJkMTVmNDBkZDU2MWVmMmJkZTJhMmEyZWNkY2U1OTYz
YjAxODU5ZmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGM3ZDM4YTQ0OTQxNjI2OGQzMDA0MDI5
YTIyMGExNWE3N2MyMjA2YTAzY2M4ODEyMGYzN2Y0NmU5NDkxNzdlOCIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 13 Mirrors 0 Missed 77 Current 414 (14% match, 84% complete)
Removing 23 stale sstate objects for arch mips32r2...done.
Removing 14 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 444 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 889 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 1035 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1057 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1063 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/make/4.4-r0/temp/log.do_packagedata_setscene.1793225
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1153 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1154 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1173 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: Running task 1174 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 1251 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: Running task 1297 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1359 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1361 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1362 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1363 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1385 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1389 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1407 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_fetch)
NOTE: Running task 1528 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe make-4.4-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe strace-6.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1619 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1621 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.2-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: Running task 1623 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1624 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1625 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: Running task 1626 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: Running task 1627 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: Running task 1628 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 504 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1630 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1631 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1632 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1633 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1634 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1636 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1637 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: Running task 1648 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 1649 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: Running task 1651 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a206e5ca9bfb216d3dcb37f8735837b27539f6a3bbad6c0ef438389972eb1307
NOTE: recipe strace-6.2-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1657 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_patch)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1658 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: Running task 1659 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: Running task 1660 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1662 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1663 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: Running task 1664 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: recipe strace-6.2-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1666 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic)
NOTE: Running task 1667 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe strace-6.2-r0: task do_populate_lic: Started
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: Running task 1669 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f4afd15a80d48448aa20cf7cb73786eed2afa02b3e2bd86610490f4d02562e4
NOTE: Running task 1673 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1675 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1676 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe strace-6.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic unihash changed to 02fa31cc1e7453197a6d88073ae8bece9b02f92461ad0f94dd82bf1c809e1798
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1678 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1680 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1681 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot unihash changed to 15b811e619cf9055d949bba7085b8ef01b53336e6bcbe74bf4f6eb7e7cb6957d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 488 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1683 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package unihash changed to c7c80e9fdd84aea56aa4196721eb46c62eaea1741434ce960c98cbe1629e68a9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Running setscene task 490 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1695 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot unihash changed to 84ba5c721346cd5c271a5b18690dc522017d46983ba70968cded8520cb9ecadd
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running task 1716 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1730 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1731 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot unihash changed to 0e9f7c77046fc4b950177db3d16fb20d6eb4c202b6853685ca33801e6b3c9367
NOTE: Setscene tasks completed
NOTE: Running task 1732 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package unihash changed to b9a23dadcdbc7a83b0ebd8d9ed49b37a0ccdcc813ffcb99a22694839962a58e6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata became valid
NOTE: Running setscene task 504 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to 4ed8b0a1ccfa921d4e63e500a586bf6def934c744b1c6e75d9ea70d43aa442f0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1736 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1737 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 1738 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 1739 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to 316a7d64062779fa01225234811abe16f86a58bd25e2812da79ce96d67817af5
NOTE: Setscene tasks completed
NOTE: Running task 1740 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1742 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to 7e177b664ab62d4b56c926b2d1562f3d05e77de452cb39c43661f7d160491d3f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 504 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1744 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1745 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe systemd-1_252.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1750 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1751 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1752 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1753 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1754 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1755 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1763 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1764 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_install: Succeeded
NOTE: Running task 1766 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: Running task 1768 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot unihash changed to 0bbaa1f3155b2e6d075ac5d03f659e50447081feb606564b32561c852f457706
NOTE: Setscene tasks completed
NOTE: Running task 1769 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1771 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Failed
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1771 tasks of which 1662 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata
Summary: There were 148 ERROR messages, returning a non-zero exit code.
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-src went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dbg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-staticdev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-doc went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-be went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-bg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-cs went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-da went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-de went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-es went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ga went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-gl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-he went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-hr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-id went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-it went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ja went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ko went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-lt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-nl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt-br went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ro went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ru went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sv went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-tr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-uk went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-vi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-cn went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-tw went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/1_2.74.5-r0/temp/log.do_packagedata.1872683
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata) failed with exit code '1'

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1698 targets, 49 skipped, 0 masked, 0 errors.
Removing 69 recipes from the core2-32 sysroot...done.
Removing 74 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 293 Local 220 Mirrors 0 Missed 73 Current 172 (75% match, 84% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 174 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 751 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 753 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 754 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 755 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 756 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 778 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 779 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 780 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 788 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_fetch)
NOTE: Running task 793 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 229 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 231 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 242 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running setscene task 243 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running setscene task 258 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 259 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 278 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe strace-6.2-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: Running setscene task 281 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 807 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 808 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 809 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 810 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 289 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running task 811 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 812 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.2-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 817 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 818 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 819 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 820 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 821 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_unpack)
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: Running task 822 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 823 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 828 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 300 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 301 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 829 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 830 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 835 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 836 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 837 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 838 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 844 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/make/4.4-r0/temp/log.do_packagedata_setscene.1990714
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running setscene task 324 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: Running setscene task 330 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: Running task 852 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 859 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 864 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 866 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 870 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 871 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 872 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 873 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 874 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: Running task 882 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 883 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 884 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 885 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 900 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 905 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 906 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: Running task 911 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 912 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 917 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 927 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 933 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 934 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: Running task 935 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 362 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 939 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 941 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running setscene task 367 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 942 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 947 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 949 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 950 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 952 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe strace-6.2-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 984 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1007 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1008 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe make-4.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 398 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe strace-6.2-r0: task do_patch: Succeeded
NOTE: Running task 1009 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1010 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 399 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.2-r0: task do_populate_lic: Started
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe strace-6.2-r0: task do_populate_lic: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic unihash changed to 02fa31cc1e7453197a6d88073ae8bece9b02f92461ad0f94dd82bf1c809e1798
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1025 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1026 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running task 1027 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1032 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1050 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 10bb837f9be944a042a4976b2679f37e5098b65a05b35e8bee72a997cbf5fff5
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1260 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1296 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1348 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1359 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: Running task 1498 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea966ecbf6aefa0dc1a4c5d4d0a88cedc818a0eb7c8fdd30980d0615db84acfb
NOTE: Running task 1534 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: Running task 1536 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1538 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1539 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1540 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: Running task 1541 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: Running task 1542 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 1543 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot unihash changed to 958b743a68f52196451b08a2a27237ae93a51b171b8c411d34c25f218810c3da
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 452 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1548 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1549 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1550 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package unihash changed to a9e4c8deeeb078e4912d020ae4f0da09d7194c427f7d41719af0ec6599523278
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 456 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 465 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1592 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1594 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1595 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1596 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1597 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1598 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1601 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1603 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 1604 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1606 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1609 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1611 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1612 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1613 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1614 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1615 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1616 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1620 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1622 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1623 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1625 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: Running task 1627 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1628 tasks of which 1489 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata
Summary: There were 148 ERROR messages, returning a non-zero exit code.
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-src went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dbg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-staticdev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-doc went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-be went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-bg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-cs went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-da went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-de went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-es went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ga went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-gl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-he went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-hr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-id went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-it went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ja went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ko went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-lt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-nl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt-br went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ro went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ru went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sv went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-tr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-uk went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-vi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-cn went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-tw went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/1_2.74.5-r0/temp/log.do_packagedata.2079865
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata) failed with exit code '1'

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/strace: SRC_URI changed from "https://strace.io/files/6.1/strace-6.1.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch" to "https://strace.io/files/6.2/strace-6.2.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch"
packages/core2-32-poky-linux/strace: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-dbg: PKGSIZE changed from 49719772 to 49952872 (+0%)
packages/core2-32-poky-linux/strace/strace-dbg: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/status-detached-threads /usr/lib/strace/ptest/tests/.debug/status-successful-threads"
packages/core2-32-poky-linux/strace/strace-dev: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-dev: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-doc: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-doc: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-locale: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-locale: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-ptest: PKGSIZE changed from 28230084 to 28260417 (+0%)
packages/core2-32-poky-linux/strace/strace-ptest: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/status-detached-threads.test /usr/lib/strace/ptest/tests/status-successful-threads /usr/lib/strace/ptest/tests/status-successful-threads.test /usr/lib/strace/ptest/tests/status-detached-threads"
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 9941254 to 9989937 (+0%)
packages/core2-32-poky-linux/strace/strace-src: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-src: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/6.1-r0/src/linux/x86_64 -> /usr/src/debug/strace/6.2-r0/src/linux/x86_64, directory renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/linux, directory renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux/netfilter/ipset -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/asm -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/asm, directory renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/rdma -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/rdma, directory renamed /usr/src/debug/strace/6.1-r0/src/gen -> /usr/src/debug/strace/6.2-r0/src/gen, directory renamed /usr/src/debug/strace/6.1-r0/src/linux/i386 -> /usr/src/debug/strace/6.2-r0/src/linux/i386, directory 
 renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux/netfilter -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/linux/netfilter, directory renamed /usr/src/debug/strace/6.1-r0/src/linux/generic -> /usr/src/debug/strace/6.2-r0/src/linux/generic, directory renamed /usr/src/debug/strace/6.1-r0/src -> /usr/src/debug/strace/6.2-r0/src, directory renamed /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/mtd -> /usr/src/debug/strace/6.2-r0/bundled/linux/include/uapi/mtd, removed "/usr/src/debug/strace/6.1-r0/tests/unlinkat.c /usr/src/debug/strace/6.1-r0/src/xlat/can_protocols.h /usr/src/debug/strace/6.1-r0/tests/prctl-sve.c /usr/src/debug/strace/6.1-r0/tests/so_linger.c /usr/src/debug/strace/6.1-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.1-r0/tests/printpath-umovestr.c /usr/src/debug/strace/6.1-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.1-r0/tests/clone-flags.c /usr/src/debug/strace/6.1-r0/tests/signal2name.c /usr/src/debug/strace/6.1-r0/tests/
 printpath-umovestr-peekdata.c /usr/src/debug/strace/6.1-r0/tests/strace-n.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.1-r0/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.1-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.1-r0/tests/quotactl.h /usr/src/debug/strace/6.1-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.1-r0/tests/quotactl.c /usr/src/debug/strace/6.1-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.1-r0/src/xlat/resource_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_types.h /usr/src/debug/str
 ace/6.1-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.1-r0/tests/utimensat.c /usr/src/debug/strace/6.1-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.1-r0/tests/fallocate.c /usr/src/debug/strace/6.1-r0/tests/ftruncate.c /usr/src/debug/strace/6.1-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.1-r0/tests/strace-x.c /usr/src/debug/strace/6.1-r0/tests/inject-nf.c /usr/src/debug/strace/6.1-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.1-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.1-r0/tests/status-none-threads.c /usr/src/debug/strace/6.1-r0/tests/getgroups.c /usr/src/debug/strace/6.1-r0/tests/setgroups.c /usr/src/debug/strace/6.1-r0/tests/signal_receive.c /usr/src/debug/strace/6.1-r0/tests/overflowu
 id.c /usr/src/debug/strace/6.1-r0/tests/utime.c /usr/src/debug/strace/6.1-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.1-r0/tests/dev-yy.c /usr/src/debug/strace/6.1-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.1-r0/tests/mq.c /usr/src/debug/strace/6.1-r0/tests/msg_name.c /usr/src/debug/strace/6.1-r0/tests/sockname.c /usr/src/debug/strace/6.1-r0/tests/clone_parent.c /usr/src/debug/strace/6.1-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.1-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.1-r0/tests/test_ucopy.h /usr/src/debug/strace/6.1-r0/tests/newfstatat.c /usr/src/debug/strace/6.1-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.1-r0/tests/test_ucopy.c /usr/src/debug/strace/6.1-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.1-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.1-r0/tes
 ts/mincore.c /usr/src/debug/strace/6.1-r0/tests/unshare.c /usr/src/debug/strace/6.1-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.1-r0/tests/getcpu.c /usr/src/debug/strace/6.1-r0/tests/ipc_sem.c /usr/src/debug/strace/6.1-r0/tests/print_quoted_string.c /usr/src/debug/strace/6.1-r0/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.1-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.1-r0/tests/sigreturn.c /usr/src/debug/strace/6.1-r0/src/xlat/bsg_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.1-r0/tests/osf_utimes.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.1-r0/tests/
 qual_fault.c /usr/src/debug/strace/6.1-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.1-r0/tests/futex_waitv.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.1-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.1-r0/tests/fsmount.c /usr/src/debug/strace/6.1-r0/tests/ksysent.c /usr/src/debug/strace/6.1-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.1-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.1-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.1-r0/tests/prctl-tagged-addr.c /usr/s
 rc/debug/strace/6.1-r0/tests/trie_test.c /usr/src/debug/strace/6.1-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/resources.h /usr/src/debug/strace/6.1-r0/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.1-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.1-r0/tests/umovestr2.c /usr/src/debug/strace/6.1-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.1-r0/tests/block_reset_run.c /usr/src/debug/strace/6.1-r0/tests/openat2.c /usr/src/debug/strace/6.1-r0/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.1-r0/tests/umount2.c /usr/src/debug/strace/6.1-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.1-r0/src/xlat/inet6_if_flags.h /usr/src/debug
 /strace/6.1-r0/tests/setpgrp-exec.c /usr/src/debug/strace/6.1-r0/tests/signalfd4.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.1-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.1-r0/src/xlat/pkey_access.h /usr/src/debug/strace/6.1-r0/tests/fanotify_init.c /usr/src/debug/strace/6.1-r0/tests/fanotify_mark.c /usr/src/debug/strace/6.1-r0/tests/xgetdents.c /usr/src/debug/strace/6.1-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.1-r0/tests/prctl-securebits.c /usr/src/debug/str
 ace/6.1-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.1-r0/tests/delete_module.c /usr/src/debug/strace/6.1-r0/tests/epoll_wait.c /usr/src/debug/strace/6.1-r0/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.1-r0/tests/sigsuspend.c /usr/src/debug/strace/6.1-r0/src/xlat/audit_arch.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.1-r0/tests/move_mount.c /usr/src/debug/strace/6.1-r0/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.1-r0/tests/xetpriority.c /usr/src/debug/strace/6.1-r0/tests/ioctl_winsize.c /usr/src/debug/strace/6.1-r0/tests/unblock_reset_raise.c /usr/src/debug/strace/6.1-r0/tests/sprintrc.c /usr/src/debug/strace/6.1-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.1-r0/sr
 c/xlat/mctp_nets.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.1-r0/tests/modify_ldt.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/pollflags.h /usr/src/debug/strace/6.1-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.1-r0/tests/status-failed.c /usr/src/debug/strace/6.1-r0/tests/status-none-f.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.1-r0/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/clone3_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/move_mount_flags.h /usr/src/de
 bug/strace/6.1-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.1-r0/tests/tprintf.c /usr/src/debug/strace/6.1-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.1-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.1-r0/tests/printsignal.c /usr/src/debug/strace/6.1-r0/tests/qual_signal.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.1-r0/src/xlat/archvals.h /usr/src/debug/strace/6.1-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.1-r0/tests/sendfile.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/readlinkat.c /usr/src/debug/strace/6.1-r0/s
 rc/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.1-r0/tests/faccessat2.c /usr/src/debug/strace/6.1-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.1-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_src.h /usr/src/debug/strace/6.1-r0/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.1-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.1-r0/tests/net-yy-unix.c /usr/src/debug/strace/6.1-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.1-r0/tests/sched_yield.c /usr/src/debug/strace/6.1-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.1-r0/tests/group_req.c /usr/src/debug/strace/6.1-r0/tests/
 sched_xetscheduler.c /usr/src/debug/strace/6.1-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.1-r0/tests/futimesat.c /usr/src/debug/strace/6.1-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.1-r0/tests/wait4.c /usr/src/debug/strace/6.1-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.1-r0/tests/process_madvise.c /usr/src/debug/strace/6.1-r0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.1-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.1-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.1-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.1-r0/tests/st
 race-p1-Y-p.c /usr/src/debug/strace/6.1-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.1-r0/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.1-r0/tests/zeroargc.c /usr/src/debug/strace/6.1-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.1-r0/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.1-r0/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.1-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.1-r0/tests/siginfo.c /usr/src/debug/strace/6.1-r0/tests/sysinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.1-r0/tests/execveat-
 -secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.1-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.1-r0/tests/readdir.c /usr/src/debug/strace/6.1-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.1-r0/tests/xettimeofday.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.1-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.1-r0/tests/clock_t_str.c /usr/src/debug/strace/6.1-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.1-r0/tests/aio.c /usr/src/debug/strace/6.1-r0/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.1-r0/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_crdly.h /usr/src/deb
 ug/strace/6.1-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.1-r0/tests/rt_sigpending.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.1-r0/tests/getresugid.c /usr/src/debug/strace/6.1-r0/tests/setresugid.c /usr/src/debug/strace/6.1-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.1-r0/tests/recvfrom.c /usr/src/debug/strace/6.1-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.1-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.1-r0/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/sock
 _type_flags.h /usr/src/debug/strace/6.1-r0/tests/brk.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioctl.c /usr/src/debug/strace/6.1-r0/tests/mbind.c /usr/src/debug/strace/6.1-r0/tests/fcntl.c /usr/src/debug/strace/6.1-r0/tests/futex.c /usr/src/debug/strace/6.1-r0/tests/flock.c /usr/src/debug/strace/6.1-r0/tests/fsync.c /usr/src/debug/strace/6.1-r0/tests/shmxt.c /usr/src/debug/strace/6.1-r0/tests/sleep.c /usr/src/debug/strace/6.1-r0/tests/statx.c /usr/src/debug/strace/6.1-r0/tests/pause.c /usr/src/debug/strace/6.1-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.1-r0/tests/pidns.h /usr/src/debug/strace/6.1-r0/tests/tests.h /usr/src/debug/strace/6.1-r0/src/xlat/sigpoll_codes.h /usr/src/debug/stra
 ce/6.1-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.1-r0/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.1-r0/tests/localtime.c /usr/src/debug/strace/6.1-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.1-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.1-r0/tests/check_sigblock.c /usr/src/debug/strace/6.1-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.1-r0/tests/kernel_old_timespec.h /usr/src/debug/strace/6.1-r0/tests/xselect.c /usr/src/debug/strace/6.1-r0/tests/lseek.c /usr/src/debug/strace/6.1-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.1-r0/tests/test_printstrn.c /usr/src/debug/strace/6.1-r0/tests/fsconfig.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.1-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/open_tree_flags.h /usr/src/
 debug/strace/6.1-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.1-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/personality_types.h /usr/src/debug/strace/6.1-r0/tests/nanosleep.c /usr/src/debug/strace/6.1-r0/tests/mknodat.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_prop.h /usr/src/debug/strace/6.1-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.1-r0/tests/sync.c /usr/src/debug/strace/6.1-r0/tests/time.c /usr/src/debug/strace/6.1-r0/tests/kcmp.c /usr/src/debug/strace/6.1-r0/tests/kill.c /usr/src/debug/strace/6.1-r0/tests/link.c /usr/src/debug/strace/6.1-r0/tests/mmap.c /usr/src/debug/strace/6.1-r0/tests/swap.c /usr/src/debug/strace/6.1-r0/tests/mmsg.c /usr/src/debug/strac
 e/6.1-r0/tests/open.c /usr/src/debug/strace/6.1-r0/tests/pipe.c /usr/src/debug/strace/6.1-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.1-r0/tests/mount_setattr.c /usr/src/debug/strace/6.1-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.1-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.1-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.1-r0/tests/execve--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/flockcmds.h /usr/src/debug/strace/6.1-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.1-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.1-r0/tests/ip_mreq.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.1-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.1-r0/tests/xutimes.c /usr/src/debug/strace/6.1-r0/tests/open_tree.c /usr/src/debug/strace/6.1-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.1-r0/tests/pread64-pwrite64.c /usr/src/debug/strace/6.1-r0/src/xlat/futexwakeops.h /usr/
 src/debug/strace/6.1-r0/tests/userfaultfd.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.1-r0/tests/secontext.h /usr/src/debug/strace/6.1-r0/tests/pidns-cache.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.1-r0/tests/net-yy-inet.c /usr/src/debug/strace/6.1-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.1-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.1-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.1-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.1-r0/tests/dup.c /usr/src/debug/strace/6.1-r0/tests/execveat.c /usr/src/debug/strace/6.1-r0/tests/renameat.c /usr/src/debug/strace/6.1-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_tsc.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_
 type_attrs.h /usr/src/debug/strace/6.1-r0/tests/quotactl_fd.c /usr/src/debug/strace/6.1-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.1-r0/tests/count-f.c /usr/src/debug/strace/6.1-r0/tests/vfork-f.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.1-r0/src/xlat/advise.h /usr/src/debug/strace/6.1-r0/src/xlat/modetypes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/dirent_types.h /usr/src/debug/strace/6.1-r0/src/xlat/usagewho.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.1-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.1-
 r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.1-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.1-r0/tests/getgid32.c /usr/src/debug/strace/6.1-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.1-r0/tests/getuid32.c /usr/src/debug/strace/6.1-r0/tests/setdomainname.c /usr/src/debug/strace/6.1-r0/tests/copy_file_range.c /usr/src/debug/strace/6.1-r0/tests/sync_file_range.c /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.1-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.1-r0/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.1-r0/tests/uio.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.1-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.1-r0/tests/getegid32.c /usr/src/debug/strace/6.1-r0/tests/geteuid32.c /usr/src/debug/strace/6.1-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.1-r0/
 tests/truncate.c /usr/src/debug/strace/6.1-r0/tests/xattr-strings.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/ioprio_who.h /usr/src/debug/strace/6.1-r0/tests/vmsplice.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.1-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.1-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.1-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.1-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.1-r0/tests/fchmodat.c /usr/src/debug/strace/6.1-r0/src/xlat/wait4_options.h /usr/src/debug/strace/6.1-r0/tests/ioctl_perf.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.1-r0/tests/printxval.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_boolopts.h 
 /usr/src/debug/strace/6.1-r0/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.1-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.1-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.1-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.1-r0/tests/status-none.c /usr/src/debug/strace/6.1-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.
 1-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_types.h /usr/src/debug/strace/6.1-r0/src/xlat/futexops.h /usr/src/debug/strace/6.1-r0/tests/truncate64.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.1-r0/tests/xchownx.c /usr/src/debug/strace/6.1-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-fp-mode.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-1.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-3.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.1-r0/tests/net-y-unix.c /usr/src/debug/strace/
 6.1-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.1-r0/tests/fork-f.c /usr/src/debug/strace/6.1-r0/tests/fchmod.c /usr/src/debug/strace/6.1-r0/tests/getcwd.c /usr/src/debug/strace/6.1-r0/tests/getgid.c /usr/src/debug/strace/6.1-r0/tests/getpid.c /usr/src/debug/strace/6.1-r0/tests/ioctl_termios.c /usr/src/debug/strace/6.1-r0/tests/getsid.c /usr/src/debug/strace/6.1-r0/tests/gettid.c /usr/src/debug/strace/6.1-r0/tests/getuid.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.1-r0/tests/waitid.c /usr/src/debug/strace/6.1-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.1-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/mmsg-silent.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_pac
 ket_options.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.1-r0/tests/restart_syscall.c /usr/src/debug/strace/6.1-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.1-r0/tests/add_key.c /usr/src/debug/strace/6.1-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.1-r0/tests/get_page_size.c /usr/src/debug/strace/6.1-r0/tests/set_sigblock.c /usr/src/debug/strace/6.1-r0/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.1-r0/tests/create_tmpfile.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.1-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.1-r0/tests/attach-
 p-cmd.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/cap.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.1-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.1-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.1-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.1-r0/tests/fsopen.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.1-r0/tests/int_0x80.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.1-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_io_info.h /usr/src/debug
 /strace/6.1-r0/tests/pc.c /usr/src/debug/strace/6.1-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.1-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.1-r0/tests/epoll_create.c /usr/src/debug/strace/6.1-r0/tests/memfd_create.c /usr/src/debug/strace/6.1-r0/tests/print_time.c /usr/src/debug/strace/6.1-r0/tests/timer_create.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.1-r0/tests/create_nl_socket.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.1-r0/tests/ioctl_ptp.c /usr/src/debug/strace/6.1-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.1-r0/tests/fchownat.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_eattr
 _attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.1-r0/tests/kexec_load.c /usr/src/debug/strace/6.1-r0/tests/netlink_audit.c /usr/src/debug/strace/6.1-r0/tests/netlink_route.c /usr/src/debug/strace/6.1-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.1-r0/tests/netlink_crypto.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.1-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.1-
 r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.1-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.1-r0/tests/run_expect_termsig.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.1-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/cap_version.h /usr/src/debug/strace/6.1-r0/tests/socketcall.c /usr/src/debug/strace/6.1-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.1-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.1-r0/tests/answer.c /usr/src/debug/strace/6.1
 -r0/tests/fchdir.c /usr/src/debug/strace/6.1-r0/tests/nlattr.c /usr/src/debug/strace/6.1-r0/tests/subdir.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.1-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.1-r0/tests/setns.c /usr/src/debug/strace/6.1-r0/tests/mknod.c /usr/src/debug/strace/6.1-r0/tests/mlock.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.1-r0/tests/mount.c /usr/src/debug/strace/6.1-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.1-r0/tests/umask.c /usr/src/debug/strace/6.1-r0/tests/uname.c /usr/src/debug/strace/6.1-r0/tests/preadv-pwritev.c /usr/src/debug/strace/6.1-r0/tests/ustat.c /usr/src/debug/strace/6.1-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.1-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.1-r0/tests/inotify.c /usr/src/debug/s
 trace/6.1-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.1-r0/tests/inotify_init1.c /usr/src/debug/strace/6.1-r0/tests/adjtimex.c /usr/src/debug/strace/6.1-r0/tests/open--secontext.c /usr/src/debug/strace/6.1-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.1-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.1-r0/src/xlat/clockflags.h /usr/src/debug/strace/6.1-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_cids.h /usr/src/debug/strace/6.1-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.1-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.1-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.1-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.1-r0/tests/print_maxfd.c /usr/src/debug/strace/6.1-r0/tests/fflush.c /usr/src/debug/strace/6.1-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.1-r0/tests/tampering-notes.c /usr/src/debug/strace/6.1-r0/tests/init_delete_module.h /usr/src/debug/strace/6
 .1-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.1-r0/src/xlat/fdflags.h /usr/src/debug/strace/6.1-r0/tests/pselect6-common.c /usr/src/debug/strace/6.1-r0/tests/munlockall.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.1-r0/tests/riscv_flush_icache.c /usr/src/debug/strace/6.1-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.1-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.1-r0/tests/ipc.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.1-r0/tests/nsyscalls.c /usr/src/debug/strace/6.1-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.1-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.1-r0/tests/mlockall.c /usr/src/
 debug/strace/6.1-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.1-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.1-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.1-r0/tests/error_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.1-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.1-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.1-r0/tests/filter-unavailable.c /usr/src/debug/strace/6.1-r0/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.1-r0/tests/i
 notify_init.c /usr/src/debug/strace/6.1-r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.1-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.1-r0/tests/ioctl_block.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.1-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.1-r0/tests/pidns.c /usr/src/debug/strace/6.1-r0/tests/pipe2.c /usr/src/debug/strace/6.1-r0/tests/ppoll.c /usr/src/debug/strace/6.1-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.1-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.1-r0/tests/oldselect.c /usr/src/debug/strace/6.1-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.1-r0/src/xlat/shm_flags.h /usr
 /src/debug/strace/6.1-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.1-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.1-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.1-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.1-r0/tests/test_printpath.c /usr/src/debug/strace/6.1-r0/tests/vhangup.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.1-r0/tests/mlock2.c /usr/src/debug/strace/6.1-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/kvm_cap.h /usr/src/debug/strace/6.1-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.1-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.1-r0/src/xlat/mctl_sync.h /usr/src/debug/strace/6.1-r0/tests/readahead.c /usr/src/debug/strace/6.1-r0/
 src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.1-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.1-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.1-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.1-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.1-r0/tests/threads-execve.c /usr/src/debug/strace/6.1-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_event_read_format.h /usr/src/debug/s
 trace/6.1-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.1-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.1-r0/tests/setrlimit.c /usr/src/debug/strace/6.1-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.1-r0/tests/close_range.c /usr/src/debug/strace/6.1-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.1-r0/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.1-r0/tests/segv_accerr.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.1-r0/tests/faccessat.c /usr/src/debug/strace/6.
 1-r0/tests/remap_file_pages.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.1-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.1-r0/tests/tail_alloc.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.1-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.1-r0/src/xlat/term_line_discs.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tcp_options.h
  /usr/src/debug/strace/6.1-r0/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.1-r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.1-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/kern_features.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.1-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.1-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.1-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.1-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.1-r0/tests/sigaction.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.1-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.1-r0/tes
 ts/attach-f-p-cmd.c /usr/src/debug/strace/6.1-r0/tests/msg_control.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.1-r0/tests/print_user_desc.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.1-r0/tests/attach-f-p.c /usr/src/debug/strace/6.1-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.1-r0/tests/umode_t.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.1-r0/tests/semop-indirect.c /usr/src/debug/strace/6.1-r0/tests/re
 nameat2.c /usr/src/debug/strace/6.1-r0/tests/old_mmap.c /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.1-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.1-r0/tests/test_nlattr.h /usr/src/debug/strace/6.1-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.1-r0/src/xlat/lockfcmds.h /usr/src/debug/strace/6.1-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.1-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.1-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.1-r0/src/xlat/bootflags3.h /usr/src/debug/strace/6.1-r0/src/xlat/quotatypes.h /usr/src/debug/strace/6.1-r0/tests/getdents64.c /usr/src/debug/strace/6.1-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.1-r0/tests/io_uring_register.c /usr/src/debug/strace/6.1-r0/tests/keyctl.c /usr/src/debug/strace/6.1-r0/tests/signal.c /
 usr/src/debug/strace/6.1-r0/tests/sysctl.c /usr/src/debug/strace/6.1-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.1-r0/tests/tgkill.c /usr/src/debug/strace/6.1-r0/tests/times-fail.c /usr/src/debug/strace/6.1-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.1-r0/tests/netlink_sock_diag.c /usr/src/debug/strace/6.1-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.1-r0/tests/request_key.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.1-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.1-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.1-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.1-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/whence_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/xfs_dqblk_flags.h /u
 sr/src/debug/strace/6.1-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.1-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.1-r0/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.1-r0/tests/semtimedop-ipc.c /usr/src/debug/strace/6.1-r0/tests/access--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.1-r0/src/xl
 at/getsock_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.1-r0/tests/erestartsys.c /usr/src/debug/strace/6.1-r0/tests/printstr.c /usr/src/debug/strace/6.1-r0/tests/umovestr.c /usr/src/debug/strace/6.1-r0/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.1-r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.1-r0/tests/preadv.c /usr/src/debug/strace/6.1-r0/tests/poke.c /usr/src/debug/strace/6.1-r0/tests/poll.c /usr/src/debug/strace/6.1-r0/tests/acct.c /usr/src/debug/strace/6.1-r0/tests/caps.c /usr/src/debug/strace/6.1-r0/tests/dup2.c /usr/src/debug/strace/6.1-r0/tests/dup3.c /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.1-r0/tests/iopl.c /usr/src/debug/strace/6.1-r0/tests/accept.c /usr/src/debug/strace/6.1-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.1-r0/tests/chroot.c /usr/
 src/debug/strace/6.1-r0/tests/linkat.c /usr/src/debug/strace/6.1-r0/tests/openat.c /usr/src/debug/strace/6.1-r0/tests/reboot.c /usr/src/debug/strace/6.1-r0/tests/select.c /usr/src/debug/strace/6.1-r0/tests/umount.c /usr/src/debug/strace/6.1-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.1-r0/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.1-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.1-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.1-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.1-r0/tests/fsync-y.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/termios_cc.h /usr/src/debug/strace/6.1-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.1-r0/tests/ifindex.c /usr/src/debug/strace/6.1-r0/src/xlat/secbits.h /usr/src/debug/strace/6.1-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.1-r0/te
 sts/s390_runtime_instr.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.1-r0/tests/prctl-name.c /usr/src/debug/strace/6.1-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.1-r0/tests/move_pages.c /usr/src/debug/strace/6.1-r0/tests/semtimedop.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.1-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.1-r0/tests/getpgrp.c /usr/src/debug/strace/6.1-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.1-r0/src/xlat/baud_options.h /usr/src/debug/stra
 ce/6.1-r0/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.1-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.1-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.1-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.1-r0/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.1-r0/tests/pwritev.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.1-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.1-r0/tests/pkey_free.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_mptcp_
 attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.1-r0/tests/sigpending.c /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.1-r0/tests/io_uring_setup.c /usr/src/debug/strace/6.1-r0/tests/xstatx.c /usr/src/debug/strace/6.1-r0/tests/fadvise64.c /usr/src/debug/strace/6.1-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.1-r0/tests/setfsugid.c /usr/src/debug/strace/6.1-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.1-r0/tests/setreugid.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.1-r0/tests/alarm.c /usr/src/debug/strace/6.1-r0/tests/btrfs.c /usr/src/debug/strace/6.1-r0/tests/chdir.c /usr/src/debug/strace/6.1-r0/tests/chmod.c /usr/src/debug/strace/6.1-r0/tests/delay.c /usr/src/debug/strace/6.1-r0/tests/dirfd.c /usr/src/debug/strace/6.1-r0/tests/readv.c /usr/src/debug/st
 race/6.1-r0/tests/rmdir.c /usr/src/debug/strace/6.1-r0/tests/semop.c /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_events.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_attach_type.h /usr/src/debug/strace/6.1-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.1-r0/tests/fdatasync.c /usr/src/debug/strace/6.1-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.1-r0/tests/syslog.c /usr/src/debug/strace/6.1-r0/tests/shutdown.c /usr/src/debug/strace/6.1-r0/tests/ptrace.c /usr/src/debug/strace/6.1-r0/tests/splice.c /usr/src/debug/strace/6.1-r0/tests/execve.c /usr/src/debug/strace/6.1-r0/tests/rename.c /usr/src/debug/strace/6.1-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_
 dcbmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.1-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.1-r0/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.1-r0/tests/prctl-sme.c /usr/src/debug/strace/6.1-r0/tests/net-packet_mreq.c /usr/src/debug/strace/6.1-r0/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.1-r0/tests/getsockname.c /usr/src/debug/strace/6.1-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.1-r0/tests/timer_xettime.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.1-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_regs.h /usr/src/
 debug/strace/6.1-r0/src/xlat/ebpf_size.h /usr/src/debug/strace/6.1-r0/tests/personality.c /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.1-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.1-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.1-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.1-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.1-r0/tests/symlink.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.1-r0/tests/times.c /usr/src/debug/strace/6.1-r0/tests/tkill.c /usr/src/debug/strace/6.1-r0/tests/status-successful.c /usr/src/debug/strace/6.1-r0/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.1-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.1-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.1-
 r0/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.1-r0/tests/ipc_shm.c /usr/src/debug/strace/6.1-r0/tests/symlinkat.c /usr/src/debug/strace/6.1-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_ports.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.1-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.1-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.1-r0/tests/clock_nanosleep.c /usr/src/debug/strace/6.1-r0/tests/tee.c /usr/src/debug/strace/6.1-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.1-r0/tests/epoll_create1.c /usr/src/debug/strace/6.1-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.1-r0/tests/eventfd.c /usr/src/debug/strace/6.1-r0/src/xlat/s
 tatx_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.1-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.1-r0/tests/arch_prctl.c /usr/src/debug/strace/6.1-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.1-r0/tests/sched_xetparam.c /usr/src/debug/strace/6.1-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.1-r0/tests/lookup_dcookie.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.1-r0/tests/errno2name.c /usr/src/debug/strace/6.1-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.1-r0/src/xlat/close_range_flags.h /usr/src/debug/s
 trace/6.1-r0/tests/printflags.c /usr/src/debug/strace/6.1-r0/tests/netlink_generic.c /usr/src/debug/strace/6.1-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.1-r0/tests/sethostname.c /usr/src/debug/strace/6.1-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.1-r0/tests/looping_threads.c /usr/src/debug/strace/6.1-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.1-r0/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.1-r0/tests/membarrier.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.1-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.1-r0/tests/access.c /usr/src/debug/strace/6.1-r0/tests/status.c /usr/src/debug/strace/6.1-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_tiocm.c /usr/src/debug/strace/6.1-r0/tests/getdents.c /usr/src/debug/strace/6.1-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace
 /6.1-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.1-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.1-r0/src/xlat/mmap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/swap_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.1-r0/tests/llseek.c /usr/src/debug/strace/6.1-r0/tests/unlink.c /usr/src/debug/strace/6.1-r0/tests/fspick.c /usr/src/debug/strace/6.1-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.1-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall.h /usr/src/debug/strace/6.1-r0/tests/umovestr3.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.1-r0/tests/stack-fcall.c /usr/src/debug/strace/6.1-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.1
 -r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioprio.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.1-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.1-r0/tests/xetitimer.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.1-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.1-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.1-r0/src/xlat/priorities.h /usr/src/debug/strace/6.1-r0/src/xlat/term_cflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_iflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_lflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags.h /usr/src/debug/strace/6.1-r0/tests/status-all.c /usr/src/debug/strace/6.1-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_loop.c /usr/src/debug/
 strace/6.1-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.1-r0/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.1-r0/tests/redirect-fds.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.1-r0/tests/mmsg_name.c /usr/src/debug/strace/6.1-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.1-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.1-r0/src/xlat/quota_formats.h /usr/src/debug/strace/6.1-r0/tests/sigprocmask.c /usr/src/debug/strace/6.1-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_m
 ode.h /usr/src/debug/strace/6.1-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.1-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.1-r0/tests/set_sigign.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.1-r0/tests/kernel_version.c /usr/src/debug/strace/6.1-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.1-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.1-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.1-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.1-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.1-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.1-r0/tests/umoven-illptr.c /usr/src/debug/stra
 ce/6.1-r0/tests/fcntl64.c /usr/src/debug/strace/6.1-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.1-r0/tests/migrate_pages.c /usr/src/debug/strace/6.1-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.1-r0/tests/so_error.c /usr/src/debug/strace/6.1-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.1-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.1-r0/tests/pidfd_open.c /usr/src/debug/strace/6.1-r0/tests/clone3.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.1-r0/tests/chmod--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.1-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.1-r0/tests/getrandom.c /usr/src/debug/strace/6.1-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.1-r0/tests/ioctl_random.c /usr/src/debug/strace/6.1-r0/tests/prlimit64.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_lookup_elem_flag
 s.h /usr/src/debug/strace/6.1-r0/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.1-r0/tests/sendfile64.c /usr/src/debug/strace/6.1-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.1-r0/tests/scm_rights.c /usr/src/debug/strace/6.1-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.1-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.1-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.1-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/dm_flags.h /usr/src/debug/strace/6.1-r0/tests/io_uring_enter.c /usr/src/debug/strace/6.1-r0/tests/process_mrelease.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.1-r0/tests/kernel_old_timex.h /usr/src/debug/
 strace/6.1-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.1-r0/tests/ftruncate64.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.1-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.1-r0/tests/kill_child.c /usr/src/debug/strace/6.1-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.1-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.1-r0/tests/getpeername.c /usr/src/debug/strace/6.1-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.1-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.1-r0/tests/check_sigign.c /usr/src/debug/strace/6.1-r0/tests/memfd_secret.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.1-r0/tests/sigaltstack.c /usr/src/debug/strace/6.1-r0/tests/cloc
 k_adjtime-common.c /usr/src/debug/strace/6.1-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.1-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.1-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.1-r0/tests/openat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.1-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.1-r0/tests/getegid.c /usr/src/debug/strace/6.1-r0/tests/geteuid.c /usr/src/debug/strace/6.1-r0/tests/getppid.c /usr/src/debug/strace/6.1-r0/tests/getxgid.c /usr/src/debug/strace/6.1-r0/tests/getxpid.c /usr/src/debug/strace/6.1-r0/tests/getxuid.c /usr/src/debug/strace/6.1-r0/tests/waitpid.c /usr/src/debug/strace/6.1-r0/tests/xetpgid.c /usr/src/debug/strace/6.1-r0/tests/setugid.c /usr/src/debug/strace/6.1-r0/tests/fcntl-common.c /usr/src/debug/strace/6.1-r0/tests/semop-common.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/
 strace/6.1-r0/tests/sxetmask.c /usr/src/debug/strace/6.1-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.1-r0/tests/status-unfinished.c /usr/src/debug/strace/6.1-r0/tests/bpf.c /usr/src/debug/strace/6.1-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.1-r0/tests/getsockname--secontext.c /usr/src/debug/strace/6.1-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.1-r0/tests/getrusage.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.1-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.1-r0/tests/recvmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.1-r0/tests/ipc_msg.c /usr/src/debug/strace/6.1-r0/tests/libmmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_nlmsgerr.c /u
 sr/src/debug/strace/6.1-r0/tests/madvise.c /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.1-r0/tests/fadvise.h /usr/src/debug/strace/6.1-r0/tests/perf_event_open.c /usr/src/debug/strace/6.1-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.1-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.1-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.1-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-retval.c /usr/src/debu
 g/strace/6.1-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.1-r0/tests/fill_memory.c /usr/src/debug/strace/6.1-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.1-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.1-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.1-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.1-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.1-r0/tests/ioperm.c /usr/src/debug/strace/
 6.1-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.1-r0/tests/finit_module.c /usr/src/debug/strace/6.1-r0/tests/prctl_marker.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.1-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.1-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.1-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.1-r0/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.1-r0/tests/init_module.c /usr/src/debug/strace/6.1-r0/tests/so_peercred.c /usr/src/
 debug/strace/6.1-r0/tests/file_handle.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.1-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.1-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.1-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.1-r0/tests/xattr.c /usr/src/debug/strace/6.1-r0/tests/read-write.c /usr/src/debug/strace/6.1-r0/tests/rt_sigsuspend.c /usr/src/debug/strace/6.1-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.1-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.1-r0/tests/xstatfsx.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.1-r0/tests/lock_file.c /usr/src/debug/strace/6.1-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.1-r0/src/xlat/aio_cmds.h /usr/src/debug
 /strace/6.1-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.1-r0/tests/libsocketcall.c /usr/src/debug/strace/6.1-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.1-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.1-r0/tests/epoll_ctl.c /usr/src/debug/strace/6.1-r0/tests/readlink.c /usr/src/debug/strace/6.1-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/timerfdflags.h /usr/src/debug/strace/6.1-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.1-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.1-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.1-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.1-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.1-r0/src/xlat/tcflsh_options.h", ad
 ded "/usr/src/debug/strace/6.2-r0/tests/fork-f.c /usr/src/debug/strace/6.2-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.2-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.2-r0/tests/error_msg.c /usr/src/debug/strace/6.2-r0/tests/net-packet_mreq.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.2-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.2-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ptrace_events.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.2-r0/tests/fcntl64.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.2-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.2-r0/tests/pselect6-common.c /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.2-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.2-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/aio_iocb_flags
 .h /usr/src/debug/strace/6.2-r0/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.2-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.2-r0/tests/mount_setattr.c /usr/src/debug/strace/6.2-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.2-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.2-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.2-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.2-r0/tests/test_nlattr.h /usr/src/debug/strace/6.2-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.2-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.2-r0/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.2-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/term_cflags_csize.h /usr/src/debug/strace
 /6.2-r0/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.2-r0/tests/personality.c /usr/src/debug/strace/6.2-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.2-r0/src/xlat/lockfcmds.h /usr/src/debug/strace/6.2-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.2-r0/tests/osf_utimes.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.2-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_capture_modes.h /usr/src/
 debug/strace/6.2-r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.2-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.2-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.2-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.2-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.2-r0/tests/mlockall.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_mode.h /usr/src/debug/strace/6.2-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.2-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.2-r0/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.2-r0/tests/fflush.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.2-r0/tests/rt_sigsus
 pend.c /usr/src/debug/strace/6.2-r0/tests/libsocketcall.c /usr/src/debug/strace/6.2-r0/tests/keyctl.c /usr/src/debug/strace/6.2-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.2-r0/tests/signal.c /usr/src/debug/strace/6.2-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.2-r0/tests/sysctl.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.2-r0/tests/qual_inject-retval.c /usr/src/debug/strace/6.2-r0/src/xlat/mctl_sync.h /usr/src/debug/strace/6.2-r0/tests/netlink_generic.c /usr/src/debug/strace/6.2-r0/tests/times-fail.c /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strac
 e/6.2-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.2-r0/tests/acct.c /usr/src/debug/strace/6.2-r0/tests/caps.c /usr/src/debug/strace/6.2-r0/tests/dup2.c /usr/src/debug/strace/6.2-r0/tests/dup3.c /usr/src/debug/strace/6.2-r0/tests/iopl.c /usr/src/debug/strace/6.2-r0/tests/kcmp.c /usr/src/debug/strace/6.2-r0/tests/kill.c /usr/src/debug/strace/6.2-r0/tests/link.c /usr/src/debug/strace/6.2-r0/tests/mmap.c /usr/src/debug/strace/6.2-r0/tests/setpgrp-exec.c /usr/src/debug/strace/6.2-r0/tests/fchmod.c /usr/src/debug/strace/6.2-r0/tests/getcwd.c /usr/src/debug/strace/6.2-r0/tests/getgid.c /usr/src/debug/strace/6.2-r0/tests/getpid.c /usr/src/debug/strace/6.2-r0/tests/getsid.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.2-r0/tests/gettid.c /usr/src/debug/strace/6.2-r0/tests/getuid.c /usr/src/debug/strace/6.2-r0/tests/waitid.c /usr/src/debug/strace/6.2-r0/tests/fill_memory.c /usr/src/debug/strace/6.2-r
 0/tests/printsignal.c /usr/src/debug/strace/6.2-r0/tests/mknodat.c /usr/src/debug/strace/6.2-r0/tests/qual_signal.c /usr/src/debug/strace/6.2-r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.2-r0/tests/print_user_desc.c /usr/src/debug/strace/6.2-r0/tests/epoll_wait.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.2-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.2-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.2-r0/tests/userfaultfd.c /usr/src/debug/strace/6.2-r0/tests/ip_mreq.c /usr/src/debug/strace/6.2-r0/tests/getgid32.c /usr/src/debug/strace/6.2-r0/tests/getuid32.c /usr/src/debug/strace/6.2-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.2-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.2-r0/tests/open_tree.c /usr/src/debug/strace/6.2-r0/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.2-r0/tests/fchownat.c /usr/src/debug/strace/6.2-r0/src/xlat/
 if_dqblk_valid.h /usr/src/debug/strace/6.2-r0/tests/fsync.c /usr/src/debug/strace/6.2-r0/tests/futex.c /usr/src/debug/strace/6.2-r0/tests/perf_event_open.c /usr/src/debug/strace/6.2-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.2-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.2-r0/tests/fchmodat.c /usr/src/debug/strace/6.2-r0/tests/create_tmpfile.c /usr/src/debug/strace/6.2-r0/tests/run_expect_termsig.c /usr/src/debug/strace/6.2-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.2-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.2-r0/tests/file_handle.c /usr/src/debug/strace/6.2-r0/tests/printflags.c /usr/src/debug/strace/6.2-r0/tests/pread64-pwrite64.c /usr/src/debug/strace/6.2-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.2-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_prop.h /usr/src/deb
 ug/strace/6.2-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.2-r0/tests/inotify_init1.c /usr/src/debug/strace/6.2-r0/tests/semtimedop.c /usr/src/debug/strace/6.2-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.2-r0/tests/set_sigign.c /usr/src/debug/strace/6.2-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.2-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.2-r0/src/xlat/advise.h /usr/src/debug/strace/6.2-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.2-r0/tests/getpeername.c /usr/src/debug/strace/6.2-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.2-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.2-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.2-r0/tests/x
 attr-strings.c /usr/src/debug/strace/6.2-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.2-r0/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.2-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.2-r0/tests/xselect.c /usr/src/debug/strace/6.2-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.2-r0/src/xlat/flockcmds.h /usr/src/debug/strace/6.2-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.2-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.2-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.2-r0/tests/mq.c /usr/src/debug/strace/6.2-r0/tests/renameat2.c /usr/src/debug/strace/6.2-r0/tests/execveat--secontext.c /us
 r/src/debug/strace/6.2-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.2-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.2-r0/tests/ioctl_block.c /usr/src/debug/strace/6.2-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.2-r0/tests/symlinkat.c /usr/src/debug/strace/6.2-r0/tests/so_error.c /usr/src/debug/strace/6.2-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.2-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.2-r0/tests/ioctl_winsize.c /usr/src/debug/strace/6.2-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/personality_types.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.2-r0/tests/r
 t_sigpending.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.2-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.2-r0/tests/vmsplice.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.2-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.2-r0/tests/getresugid.c /usr/src/debug/strace/6.2-r0/tests/setresugid.c /usr/src/debug/strace/6.2-r0/tests/execveat.c /usr/src/debug/strace/6.2-r0/tests/renameat.c /usr/src/debug/strace/6.2-r0/tests/ipc_sem.c /usr/src/debug/strace/6.2-r0/tests/umovestr2.c /usr/src/debug/strace/6.2-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.2-r0/tests/fdatasync.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strac
 e/6.2-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.2-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.2-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.2-r0/tests/futimesat.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.2-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.2-r0/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.2-r0/tests/init_delete_module.h /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.2-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.2-r0/tests/getxuid.c /usr/src/debug/strace/6.2-r0/tests/waitpid.c /usr/src/debug/strace/6.2-r0/tests/xetpgid.c /usr/src/debug/strace/6.2-r0/tests/setugid.c /usr
 /src/debug/strace/6.2-r0/tests/getegid.c /usr/src/debug/strace/6.2-r0/tests/geteuid.c /usr/src/debug/strace/6.2-r0/tests/getppid.c /usr/src/debug/strace/6.2-r0/tests/getxgid.c /usr/src/debug/strace/6.2-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.2-r0/tests/getxpid.c /usr/src/debug/strace/6.2-r0/tests/ioctl_ptp.c /usr/src/debug/strace/6.2-r0/tests/eventfd.c /usr/src/debug/strace/6.2-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.2-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.2-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.2-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.2-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.2-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.2-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.2-r0/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.2-r0/src/xlat/pkey_access.h /usr/src/debug/st
 race/6.2-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.2-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.2-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.2-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.2-r0/tests/kexec_load.c /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.2-r0/tests/bpf.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.2-r0/tests/filter-unavailable.c /usr/src/debug/strace/6.2-r0/sr
 c/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.2-r0/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.2-r0/tests/io_uring_register.c /usr/src/debug/strace/6.2-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.2-r0/tests/readahead.c /usr/src/debug/strace/6.2-r0/tests/io_uring_setup.c /usr/src/debug/strace/6.2-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.2-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.2-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.2-r0/tests/test_printpath.c /usr/src/debug/strace/6.2-r0/src/xlat/secbits.h /usr/src/debug/strace/6.2-r0/tests/move_mount.c /usr/src/debug/strace/6.2-r0/src/xlat/clockflags.h /usr/src/debug/strace/6.2-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.2-r0/src/xlat/vsock_cids.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_balance_flags
 .h /usr/src/debug/strace/6.2-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.2-r0/tests/io_uring_enter.c /usr/src/debug/strace/6.2-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.2-r0/tests/madvise.c /usr/src/debug/strace/6.2-r0/tests/fadvise.h /usr/src/debug/strace/6.2-r0/tests/test_printstrn.c /usr/src/debug/strace/6.2-r0/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.2-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.2-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.2-r0/tests/printstr.c /usr/src/debug/strace/6.2-r0/tests/umovestr.c /usr/src/debug/strace/6.2-r0/src/xlat/clone3_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_api_features.h /usr/src/debug/strace/
 6.2-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.2-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.2-r0/tests/print_time.c /usr/src/debug/strace/6.2-r0/tests/tee.c /usr/src/debug/strace/6.2-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.2-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.2-r0/tests/adjtimex.c /usr/src/debug/strace/6.2-r0/tests/signalfd4.c /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.2-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.2-r0/tests/semtimedop-ipc.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.2-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.2-r0/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ioctl_dirs.h /usr/src/debug/s
 trace/6.2-r0/tests/pidns.h /usr/src/debug/strace/6.2-r0/tests/tests.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.2-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.2-r0/tests/rmdir.c /usr/src/debug/strace/6.2-r0/tests/lseek.c /usr/src/debug/strace/6.2-r0/tests/mbind.c /usr/src/debug/strace/6.2-r0/tests/mknod.c /usr/src/debug/strace/6.2-r0/tests/mlock.c /usr/src/debug/strace/6.2-r0/tests/mount.c /usr/src/debug/strace/6.2-r0/tests/utime.c /usr/src/debug/strace/6.2-r0/tests/alarm.c /usr/src/debug/strace/6.2-r0/tests/btrfs.c /usr/src/debug/strace/6.2-r0/tests/pause.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.2-r0/tests/sigpending.c /usr/src/debug/strace/6.2-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.2-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_devc
 onf_indices.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.2-r0/tests/add_key.c /usr/src/debug/strace/6.2-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.2-r0/tests/fsopen.c /usr/src/debug/strace/6.2-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.2-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.2-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.2-r0/tests/request_key.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.2-r0/tests/process_madvise.c /usr/src/debug/strace/6.2-r0/t
 ests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.2-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.2-r0/tests/recvfrom.c /usr/src/debug/strace/6.2-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.2-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.2-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.2-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.2-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.2-r0/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.2-r0/tests/remap_file_pages.c /usr/src/debug/strace/6.2-r0/tests/xstatx.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_spec_set_store_bypass
 _flags.h /usr/src/debug/strace/6.2-r0/tests/zeroargc.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.2-r0/src/xlat/sg_io_info.h /usr/src/debug/strace/6.2-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.2-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.2-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.2-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_types.h /usr/src/debug/strace/6.2-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.2-r0/tests/signal_receive.c /usr/src/debug/strace/6.2-r0/tests/unlinkat.c /usr/src/debug/strace/6.2-r0/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/6.2-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.2-r0/src/xlat/baud_options.h /usr/src/debug/strace/6.2-r0/src/x
 lat/mctp_addrs.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.2-r0/tests/msg_name.c /usr/src/debug/strace/6.2-r0/tests/sockname.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.2-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.2-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.2-r0/tests/answer.c /usr/src/debug/strace/6.2-r0/tests/fchdir.c /usr/src/debug/strace/6.2-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.2-r0/tests/nlattr.c /usr/src/debug/strace/6.2-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.2-r0/tests/subdir.c /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.2-r0/tests/accept.c /usr/src/debug/strace/6.2-r0/tests/chroot.c /usr/src/debug/strace/6.2-r0/tests/gro
 up_req.c /usr/src/debug/strace/6.2-r0/tests/linkat.c /usr/src/debug/strace/6.2-r0/tests/openat.c /usr/src/debug/strace/6.2-r0/tests/reboot.c /usr/src/debug/strace/6.2-r0/tests/select.c /usr/src/debug/strace/6.2-r0/tests/umount.c /usr/src/debug/strace/6.2-r0/tests/preadv.c /usr/src/debug/strace/6.2-r0/tests/futex_waitv.c /usr/src/debug/strace/6.2-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.2-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.2-r0/tests/sigreturn.c /usr/src/debug/strace/6.2-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.2-r0/tests/kernel_version.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.2-r0/tests/fanotify_init.c /usr/src/debug/strace/6.2-r0/tests/fanotify_mark.c /usr/src/debug/strace/6.2-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.2
 -r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/dm_flags.h /usr/src/debug/strace/6.2-r0/tests/status-failed.c /usr/src/debug/strace/6.2-r0/tests/status-none-f.c /usr/src/debug/strace/6.2-r0/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.2-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.2-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.2-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.2-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.2-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.2-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.2-r0/tests/quotactl.c /usr/src/debug/strace/6.2-r0/tests/quotactl.h /usr/src/debug/strace/6.2-r0/tests/erestartsys.c /usr/src/debug/strace/6.2-r0/tests/finit_module.c /usr/src/debug/strace/6.2-r0/tests/prctl_marker.c /usr/src/debug/strace/6.2-r0/tests/sxetmask.c /usr/src/debug/strace/6.2-r0/tests/xett
 imeofday.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.2-r0/tests/close_range.c /usr/src/debug/strace/6.2-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.2-r0/tests/looping_threads.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.2-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.2-r0/tests/shutdown.c /usr/src/debug/strace/6.2-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/timerfdflags.h /usr/src/debug/strace/6.2-r0/tests/ioctl_evdev-success.c /u
 sr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.2-r0/tests/printxval.c /usr/src/debug/strace/6.2-r0/tests/print_quoted_string.c /usr/src/debug/strace/6.2-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.2-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.2-r0/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.2-r0/tests/openat2.c /usr/src/debug/strace/6.2-r0/tests/umount2.c /usr/src/debug/strace/6.2-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.2-r0/tests/tampering-notes.c /usr/src/debug/strace/6.2-r0/tests/prlimit64.c /usr/src/debug/strace/6.2-r0/tests/attach-p-cmd.h /usr/src/debug/strace/6.2-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.2-r0/tests/ioctl_termios.c /usr/src/debug/strace/6.2-r0/tests/ipc.c /usr/src/debug/strace/6.2-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.2-r
 0/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.2-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.2-r0/tests/kernel_old_timespec.h /usr/src/debug/strace/6.2-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.2-r0/src/xlat/futexops.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.2-r0/tests/oldselect.c /usr/src/debug/strace/6.2-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.2-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.2-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.2-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.2-r0/tests/status-none-threads.c /usr/src/debug/strace/6.2-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.2-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.2-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.2-r0/tests/mlock2.c /usr/src/debug/strace/6.2-r0/src/xlat/ifstats
 _xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.2-r0/tests/so_peercred.c /usr/src/debug/strace/6.2-r0/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.2-r0/tests/net-yy-unix.c /usr/src/debug/strace/6.2-r0/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.2-r0/tests/setfsugid.c /usr/src/debug/strace/6.2-r0/tests/setreugid.c /usr/src/debug/strace/6.2-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.2-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.2-r0/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.2-r0/tests/pidns-cache.c /usr/src/debug/strace/6.2-r0/tests/sigaltstack.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.2-r0/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.2-r0/te
 sts/mmsg-silent.c /usr/src/debug/strace/6.2-r0/tests/stack-fcall-3.c /usr/src/debug/strace/6.2-r0/tests/prctl-fp-mode.c /usr/src/debug/strace/6.2-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.2-r0/tests/stack-fcall-1.c /usr/src/debug/strace/6.2-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.2-r0/tests/printpath-umovestr.c /usr/src/debug/strace/6.2-r0/src/xlat/cap_version.h /usr/src/debug/strace/6.2-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.2-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.2-r0/tests/execve--secontext.c /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.2-r0/tests/readdir.c /usr/src/debug/strace/6.2-r0/tests/socketcall.c /usr/src/debug/strace/6.2-r0/tests/epoll_create.c /usr/src/debug/strace/6.2-r0/tests/memfd_create.c /usr/src/debug/strace/6.2-r0/tests/timer_create.c /usr/src/debug/strace/6.2-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace
 /6.2-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.2-r0/src/xlat/ioprio_who.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.2-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.2-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.2-r0/tests/inject-nf.c /usr/src/debug/strace/6.2-r0/tests/ipc_shm.c /usr/src/debug/strace/6.2-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.2-r0/tests/netlink_audit.c /usr/src/debug/strace/6.2-r0/tests/netlink_route.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.2-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.2-r0/tests/stack-fcall.c /usr/src/debug/
 strace/6.2-r0/tests/stack-fcall.h /usr/src/debug/strace/6.2-r0/tests/net-yy-inet.c /usr/src/debug/strace/6.2-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.2-r0/tests/xstatfsx.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.2-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.2-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.2-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.2-r0/tests/getgroups.c /usr/src/debug/strace/6.2-r0/tests/setgroups.c /usr/src/debug/strace/6.2-r0/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.2-r0/src/xlat/futexwakeops.h /usr/src/debug/strace/6.2-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.2-r0/tests/delete_module.c /usr/src/debug/strace/6.2-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.2-r0/src/x
 lat/packet_diag_info_flags.h /usr/src/debug/strace/6.2-r0/tests/attach-f-p.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.2-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.2-r0/tests/process_mrelease.c /usr/src/debug/strace/6.2-r0/tests/xgetdents.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.2-r0/tests/prctl-sme.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.2-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.2-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.2-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.2-r0/tests/unblock_reset_raise.c /usr/src/debug/strace/6.2-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_sp
 ec_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.2-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.2-r0/tests/sched_xetparam.c /usr/src/debug/strace/6.2-r0/tests/readlink.c /usr/src/debug/strace/6.2-r0/tests/segv_accerr.c /usr/src/debug/strace/6.2-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.2-r0/src/xlat/vsock_ports.h /usr/src/debug/strace/6.2-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.2-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.2-r0/src/
 xlat/route_nexthop_flags.h /usr/src/debug/strace/6.2-r0/tests/tail_alloc.c /usr/src/debug/strace/6.2-r0/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.2-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.2-r0/tests/clock_adjtime-common.c /usr/src/debug/strace/6.2-r0/src/xlat/cap.h /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.2-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.2-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.2-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.2-r0/tests/create_nl_socket.c /usr/src/debug/strace/6.2-r0/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.2-r0/tests/kern_features.c /usr/src/debug/strace/6.2-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_info_data
 _tun_attrs.h /usr/src/debug/strace/6.2-r0/tests/count-f.c /usr/src/debug/strace/6.2-r0/tests/vfork-f.c /usr/src/debug/strace/6.2-r0/tests/chmod--secontext.c /usr/src/debug/strace/6.2-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.2-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.2-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.2-r0/tests/mincore.c /usr/src/debug/strace/6.2-r0/tests/unshare.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.2-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.2-r0/tests/timer_xettime.c /usr/src/debug/strace/6.2-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.2-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.2-r0/src/xlat/bootflags3.h /usr/src/debug/strace/6.2-r0/src/xlat/quota
 types.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.2-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.2-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.2-r0/src/xlat/pollflags.h /usr/src/debug/strace/6.2-r0/tests/inotify_init.c /usr/src/debug/strace/6.2-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.2-r0/tests/xetitimer.c /usr/src/debug/strace/6.2-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.2-r0/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/archvals.h /usr/src/debug/strace/6.2-r0/tests/pidns.c /usr/src/debug/strace/6.2-r0/tests/pipe2.c /usr/src/debug/strace/6.2-r0/tests/semop.c /usr/src/debug/strace/6.2-r0/tests/setns.c /usr/src/debug/strace/6.2-r0/tests/umask.c /usr/src/debug/strace/6.2-r0/tests/uname.c /usr/src/debug/strace/6.2-r0/test
 s/ustat.c /usr/src/debug/strace/6.2-r0/tests/wait4.c /usr/src/debug/strace/6.2-r0/tests/shmxt.c /usr/src/debug/strace/6.2-r0/tests/sleep.c /usr/src/debug/strace/6.2-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.2-r0/src/xlat/kvm_cap.h /usr/src/debug/strace/6.2-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.2-r0/tests/umovestr3.c /usr/src/debug/strace/6.2-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.2-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.2-r0/tests/tprintf.c /usr/src/debug/strace/6.2-r0/tests/sprintrc.c /usr/src/debug/strace/6.2-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.2-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.2-r0/tests/openat--secontext.c /usr/src/debug/strace/6.2-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.2-r0/tests/sigsuspend.c /usr/src/debug/strace/6.2-r0/tests/test_ucopy.h /usr/src/debug/strace/6.2-r0/tests/test_ucopy.c /usr/src/debug/strace/6.2-r0/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.2-r0/tests
 /utimensat.c /usr/src/debug/strace/6.2-r0/tests/epoll_create1.c /usr/src/debug/strace/6.2-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.2-r0/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.2-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.2-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.2-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.2-r0/src/xlat/modetypes.h /usr/src/debug/strace/6.2-r0/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.2-r0/tests/clone-flags.c /usr/src/debug/strace/6.2-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.2-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.2-r0/tests/print_maxfd.c /usr/src/debug/strace/6.2-r0/tests/strace-x.c /usr/src/debug/strace/6
 .2-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.2-r0/src/xlat/term_line_discs.h /usr/src/debug/strace/6.2-r0/tests/siginfo.c /usr/src/debug/strace/6.2-r0/tests/sysinfo.c /usr/src/debug/strace/6.2-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.2-r0/tests/overflowuid.c /usr/src/debug/strace/6.2-r0/tests/readlinkat.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.2-r0/tests/ipc_msg.c /usr/src/debug/strace/6.2-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.2-r0/tests/libmmsg.c /usr/src/debug/strace/6.2-r0/tests/recvmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.2-r0/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.2-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.
 2-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.2-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.2-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.2-r0/tests/so_linger.c /usr/src/debug/strace/6.2-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.2-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.2-r0/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.2-r0/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.2-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.2-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.2-r0/tests/check_sigblock.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.2-r0/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.2-r0/tests/getpgrp.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_nexthop_attrs.h /us
 r/src/debug/strace/6.2-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.2-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.2-r0/tests/read-write.c /usr/src/debug/strace/6.2-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.2-r0/tests/ioctl_perf.c /usr/src/debug/strace/6.2-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.2-r0/tests/sigaction.c /usr/src/debug/strace/6.2-r0/src/xlat/close_range_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.2-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.2-r0/tests/s390_runtime_instr.c /usr/src/debug/strace/6.2-r0/src/xlat/aio_cmds.h /usr/src/debug/strace/6.2-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.2-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.2-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.2-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/st
 race/6.2-r0/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.2-r0/tests/prctl-securebits.c /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.2-r0/tests/nanosleep.c /usr/src/debug/strace/6.2-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.2-r0/tests/modify_ldt.c /usr/src/debug/strace/6.2-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.2-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.2-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.2-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.2-r0/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.2-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/shm_flags.h /usr/src/debug/strace/6.2-r0/tests/redirect-fds.c /usr/src/debug/strace/6.2-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.
 2-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.2-r0/tests/fadvise64.c /usr/src/debug/strace/6.2-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.2-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_src.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.2-r0/tests/secontext.h /usr/src/debug/strace/6.2-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.2-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.2-r0/tests/getdents64.c /usr/src/debug/strace/6.2-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.2-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.2-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.2-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.2-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.2-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.2-r0/src/xlat/ipc_msg_flags.h
  /usr/src/debug/strace/6.2-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.2-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.2-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.2-r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.2-r0/tests/status-successful.c /usr/src/debug/strace/6.2-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.2-r0/tests/ioctl_loop.c /usr/src/debug/strace/6.2-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.2-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.2-r0/tests/open--secontext.c /usr/src/debug/strace/6.2-r0/tests/getrusage.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.2-r0/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.2-r0/src/xlat/mmap_flags.h /usr/src/debug/
 strace/6.2-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.2-r0/src/xlat/swap_flags.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.2-r0/tests/faccessat.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/quota_formats.h /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.2-r0/tests/fspick.c /usr/src/debug/strace/6.2-r0/tests/llseek.c /usr/src/debug/strace/6.2-r0/tests/unlink.c /usr/src/debug/strace/6.2-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.2-r0/tests/ioperm.c /usr/src/debug/strace/6.2-r0/src/x
 lat/fan_init_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.2-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.2-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.2-r0/tests/vhangup.c /usr/src/debug/strace/6.2-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.2-r0/tests/execve.c /usr/src/debug/strace/6.2-r0/tests/ptrace.c /usr/src/debug/strace/6.2-r0/tests/rename.c /usr/src/debug/strace/6.2-r0/tests/splice.c /usr/src/debug/strace/6.2-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.2-r0/tests/pc.c /usr/src/debug/strace/6.2-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.2-r0/tests/syslog.c /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.2-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.2-r0/tests/riscv_flush_
 icache.c /usr/src/debug/strace/6.2-r0/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.2-r0/tests/sethostname.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.2-r0/src/xlat/resource_flags.h /usr/src/debug/strace/6.2-r0/tests/migrate_pages.c /usr/src/debug/strace/6.2-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.2-r0/tests/munlockall.c /usr/src/debug/strace/6.2-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.2-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.2-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.2-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.2-r0/tests/restart_syscall.c /usr/src/debug/strace/6.2-r0/tests/pkey_free.c /u
 sr/src/debug/strace/6.2-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.2-r0/tests/xetpriority.c /usr/src/debug/strace/6.2-r0/tests/tgkill.c /usr/src/debug/strace/6.2-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.2-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.2-r0/tests/prctl-sve.c /usr/src/debug/strace/6.2-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.2-r0/tests/mmsg_name.c /usr/src/debug/strace/6.2-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.2-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.2-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.2-r0/tests/clone_parent.c /usr/src/debug/strace/6.2-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.2-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.2-r0/src/xlat/priorities.h /usr/src/debug/strace/6.2-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.2-r0/te
 sts/old_mmap.c /usr/src/debug/strace/6.2-r0/src/xlat/mctp_nets.h /usr/src/debug/strace/6.2-r0/tests/clock_nanosleep.c /usr/src/debug/strace/6.2-r0/tests/localtime.c /usr/src/debug/strace/6.2-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.2-r0/src/xlat/usagewho.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.2-r0/tests/pidfd_open.c /usr/src/debug/strace/6.2-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.2-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.2-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.2-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.2-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.2-r0/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.2-r0/tests/access--secontext.c 
 /usr/src/debug/strace/6.2-r0/tests/getsockname.c /usr/src/debug/strace/6.2-r0/tests/errno2name.c /usr/src/debug/strace/6.2-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.2-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.2-r0/tests/sendfile.c /usr/src/debug/strace/6.2-r0/tests/getsockname--secontext.c /usr/src/debug/strace/6.2-r0/tests/net-y-unix.c /usr/src/debug/strace/6.2-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.2-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.2-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.2-r0/tests/epoll_ctl.c /usr/src/debug/strace/6.2-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.2-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.2-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.2-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_u
 log.c /usr/src/debug/strace/6.2-r0/src/xlat/wait4_options.h /usr/src/debug/strace/6.2-r0/tests/access.c /usr/src/debug/strace/6.2-r0/tests/status.c /usr/src/debug/strace/6.2-r0/src/xlat/term_cflags.h /usr/src/debug/strace/6.2-r0/src/xlat/term_iflags.h /usr/src/debug/strace/6.2-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/term_lflags.h /usr/src/debug/strace/6.2-r0/src/xlat/term_oflags.h /usr/src/debug/strace/6.2-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.2-r0/tests/fcntl-common.c /usr/src/debug/strace/6.2-r0/tests/semop-common.c /usr/src/debug/strace/6.2-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.2-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.2-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.2-r0/tests/ioctl_tiocm.c /usr/src/debug/strace/6.2-r0/src/xlat/
 btrfs_fs_info_flags.h /usr/src/debug/strace/6.2-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.2-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.2-r0/tests/fallocate.c /usr/src/debug/strace/6.2-r0/tests/ftruncate.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.2-r0/tests/kill_child.c /usr/src/debug/strace/6.2-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.2-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.2-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.2-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.2-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.2-r0/src/xlat/s
 ock_irda_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.2-r0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.2-r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.2-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.2-r0/tests/block_reset_run.c /usr/src/debug/strace/6.2-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.2-r0/tests/nsyscalls.c /usr/src/debug/strace/6.2-r0/tests/ioctl.c /usr/src/debug/strace/6.2-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.2-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.2-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.2-r0/tests/trie_test.c /usr/src/debug/strace/6.2-r0/tests/semop-indir
 ect.c /usr/src/debug/strace/6.2-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.2-r0/tests/truncate64.c /usr/src/debug/strace/6.2-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.2-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.2-r0/tests/inotify.c /usr/src/debug/strace/6.2-r0/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.2-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.2-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.2-r0/tests/dup.c /usr/src/debug/strace/6.2-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.2-r0/tests/status-successful-threads.c /usr/src/debug/strace/6.2-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.2-r0/tests/filter_seccomp-flag.c
  /usr/src/debug/strace/6.2-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.2-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.2-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.2-r0/tests/qual_fault.c /usr/src/debug/strace/6.2-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.2-r0/tests/scm_rights.c /usr/src/debug/strace/6.2-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.2-r0/tests/clone3.c /usr/src/debug/strace/6.2-r0/tests/
 quotactl_fd.c /usr/src/debug/strace/6.2-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.2-r0/tests/getdents.c /usr/src/debug/strace/6.2-r0/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.2-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.2-r0/tests/prctl-name.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.2-r0/tests/pwritev.c /usr/src/debug/strace/6.2-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.2-r0/tests/sched_yield.c /usr/src/debug/strace/6.2-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.2-r0/tests/msg_control.c /usr/src/debug/strace/6.2-r0/tests/arch_prctl.c /usr/src/debug/strace/6.2-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.2-r0/tests/stra
 ce-n.c /usr/src/debug/strace/6.2-r0/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.2-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.2-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.2-r0/src/xlat/dirent_types.h /usr/src/debug/strace/6.2-r0/tests/ifindex.c /usr/src/debug/strace/6.2-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.2-r0/tests/threads-execve.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_flags.h /usr/src/debug/strace/6.2-r0/tests/readv.c /usr/src/debug/strace/6.2-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.2-r0/tests/statx.c /usr/src/debug/strace/6.2-r0/tests/chdir.c /usr/src/debug/strace/6.2-r0/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.2-r0/tests/chmod.c /usr/src/debug/strace/6.2-r0/tests/ppoll.c /usr/src/debug
 /strace/6.2-r0/tests/delay.c /usr/src/debug/strace/6.2-r0/tests/xattr.c /usr/src/debug/strace/6.2-r0/tests/dirfd.c /usr/src/debug/strace/6.2-r0/tests/fcntl.c /usr/src/debug/strace/6.2-r0/tests/flock.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_tsc.h /usr/src/debug/strace/6.2-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.2-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.2-r0/tests/uio.c /usr/src/debug/strace/6.2-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.2-r0/tests/netlink_sock_diag.c /usr/src/debug/strace/6.2-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.2-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.2-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.2-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.2-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.2-r0/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.2-r0/src/xlat/ebpf
 _size.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/resources.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.2-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.2-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.2-r0/tests/lookup_dcookie.c /usr/src/debug/strace/6.2-r0/src/xlat/can_protocols.h /usr/src/debug/strace/6.2-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.2-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.2-r0/tests/sendfile64.c /usr/src/debug/strace/6.2-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.2-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.2-r0/tests/fsync-y.c /usr/sr
 c/debug/strace/6.2-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.2-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.2-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.2-r0/tests/set_sigblock.c /usr/src/debug/strace/6.2-r0/tests/ioctl_random.c /usr/src/debug/strace/6.2-r0/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.2-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.2-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.2-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.2-r0/src/xlat/termios_cc.h /usr/src/debug/strace/6.2-r0/tests/fsconfig.c /usr/src/debug/strace/6.2-r0/tests/lock_file.c /usr/src/debug/strace/6
 .2-r0/tests/status-detached-threads.c /usr/src/debug/strace/6.2-r0/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.2-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.2-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.2-r0/tests/copy_file_range.c /usr/src/debug/strace/6.2-r0/tests/sync_file_range.c /usr/src/debug/strace/6.2-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.2-r0/tests/sigprocmask.c /usr/src/debug/strace/6.2-r0/tests/clock_t_str.c /usr/src/debug/strace/6.2-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.2-r0/tests/getcpu.c /usr/src/debug/strace/6.2-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_memories.h /usr/src/d
 ebug/strace/6.2-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.2-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.2-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.2-r0/tests/ioprio.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.2-r0/tests/sched_xetscheduler.c /usr/src/debug/strace/6.2-r0/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.2-r0/tests/check_sigign.c /usr/src/debug/strace/6.2-r0/tests/memfd_secret.c /usr/src/debug/strace/6.2-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.2-r0/tests/init_module.c /usr/src/debug/strace/6.2-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.2-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.2-r0/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat
 /rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.2-r0/tests/newfstatat.c /usr/src/debug/strace/6.2-r0/tests/getrandom.c /usr/src/debug/strace/6.2-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.2-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.2-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.2-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.2-r0/tests/symlink.c /usr/src/debug/strace/6.2-r0/src/xlat/statx_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.2-r0/tests/umode_t.c /usr/src/debug/strace/6.2-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.2-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.2-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.2-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.2-r0/tests/setrlimit.c /usr/src/debug/strace/6.2
 -r0/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.2-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.2-r0/tests/get_page_size.c /usr/src/debug/strace/6.2-r0/tests/netlink_crypto.c /usr/src/debug/strace/6.2-r0/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.2-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_attach_type.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.2-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.2-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.2-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.2-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.2-r0/tests/status-none.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_ipx_options.h /usr/
 src/debug/strace/6.2-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.2-r0/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.2-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.2-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.2-r0/tests/status-all.c /usr/src/debug/strace/6.2-r0/src/xlat/bsg_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.2-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.2-r0/src/xlat/getsock_options.h /usr/src/debug/strace/6.2-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.2-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.2-r0/tests/brk.c /usr/src/debug/strace/6.2-r0/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.2-r0/tests/kernel_old_timex.h /usr/src/debug/strace/6.2-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.2-r0/src/xlat/whence_codes.h /usr/src/de
 bug/strace/6.2-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.2-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.2-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.2-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.2-r0/tests/int_0x80.c /usr/src/debug/strace/6.2-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.2-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.2-r0/tests/fsmount.c /usr/src/debug/strace/6.2-r0/tests/ksysent.c /usr/src/debug/strace/6.2-r0/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.2-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.2-r0/src/xla
 t/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.2-r0/tests/getegid32.c /usr/src/debug/strace/6.2-r0/tests/geteuid32.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.2-r0/tests/times.c /usr/src/debug/strace/6.2-r0/tests/tkill.c /usr/src/debug/strace/6.2-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.2-r0/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.2-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.2-r0/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.2-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.2-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.2-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.2-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/ubi_volume_props.h /usr/src
 /debug/strace/6.2-r0/tests/aio.c /usr/src/debug/strace/6.2-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.2-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.2-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.2-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.2-r0/tests/signal2name.c /usr/src/debug/strace/6.2-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.2-r0/src/xlat/audit_arch.h /usr/src/debug/strace/6.2-r0/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.2-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.2-r0/tests/umoven-illptr.c /usr/src/debug/strace/6.2-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.2-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.2-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.2-r0/tests/status-unfinished.c /usr/src/debug/strace/6.2-r0/tests/setdomainname.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_features_compat.h /usr/
 src/debug/strace/6.2-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.2-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.2-r0/tests/move_pages.c /usr/src/debug/strace/6.2-r0/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.2-r0/tests/xutimes.c /usr/src/debug/strace/6.2-r0/tests/xchownx.c /usr/src/debug/strace/6.2-r0/tests/dev-yy.c /usr/src/debug/strace/6.2-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.2-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.2-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.2-r0/tests/membarrier.c /usr/src/debug/strace/6.2-r0/tests/mmsg.c /usr/src/debug/strace/6.2-r0/tests/open.c /usr/src/debug/strace/6.2-r0/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.2-r0/tests/pipe.c /usr/src/debug/strace/6.2-r0/tests/poke.c /usr/src/debug/strace/6.2-r0/tests/poll.c /usr/src/debug/strace/6.2-r0/tests/swap.c /usr/src/debug/strace/6.2-r0/tests/sync.c /usr/src/debug/strace/6.2-r0/tests/time.c /usr/src/debug/strace/6
 .2-r0/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.2-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.2-r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.2-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.2-r0/tests/ftruncate64.c /usr/src/debug/strace/6.2-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.2-r0/tests/faccessat2.c /usr/src/debug/strace/6.2-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.2-r0/tests/truncate.c /usr/src/debug/strace/6.2-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.2-r0/tests/preadv-pwritev.c /usr/src/debug/strace/6.2-r0/src/xlat/fdflags.h"
packages/core2-32-poky-linux/strace/strace-staticdev: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace-staticdev: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/strace/strace: PKGSIZE changed from 1351049 to 1355145 (+0%)
packages/core2-32-poky-linux/strace/strace: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/strace/strace: PV changed from "6.1" to "6.2"

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 13 Mirrors 0 Missed 77 Current 418 (14% match, 84% complete)
Removing 23 stale sstate objects for arch ppc7400...done.
Removing 14 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 448 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 889 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/make/4.4-r0/temp/log.do_packagedata_setscene.1891930
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1039 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1040 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1062 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1068 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: Running task 1259 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1270 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: Running task 1271 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 1304 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Started
NOTE: Running task 1371 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1373 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1374 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1375 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1397 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1401 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1419 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_fetch)
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: Running task 1540 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe strace-6.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1632 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1633 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1635 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1636 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1637 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1638 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: Running task 1640 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1642 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe strace-6.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe make-4.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1644 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1645 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1647 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1648 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1659 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1660 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: Running task 1661 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 315cf3b33000799e6b4c8ebcb437a3ee2f518c8ace1206eb1300b7e859ddf790
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: Running task 1668 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1671 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: recipe strace-6.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: Running task 1673 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1675 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1676 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1677 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1678 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe strace-6.2-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1680 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic)
NOTE: recipe strace-6.2-r0: task do_populate_lic: Started
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 60694d5580c37a2f0574470f273d7ef18b7e5cde6370332f9903f5368d5d61d1
NOTE: Running task 1684 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: Running task 1686 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe strace-6.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic unihash changed to 02fa31cc1e7453197a6d88073ae8bece9b02f92461ad0f94dd82bf1c809e1798
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1688 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1690 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1691 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1692 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1693 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot unihash changed to b8c34cf35660cb07eaef3eabeb6c2c3a8e025ab9566ac2edc7068c052d286600
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 492 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1696 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1697 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1708 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot unihash changed to 0ae9a6f5c3d90f31c4feffd0a7b84dd438b0ae533d4a2a71ecf9f9c73d4e4b6a
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package unihash changed to bdc7a6c366fb05b88f4e951087eab4917ffdeadc164b6d3d3e7eefb9d1c42dd6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Running setscene task 494 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1730 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1744 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: Running task 1745 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot unihash changed to 3c0231a9fe4536dab0ad4d2026f7900092697c456a2dd19d9d41210d5464a0d7
NOTE: Setscene tasks completed
NOTE: Running task 1746 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package unihash changed to ca68bc25af1d7771ef2164bac202e11796683d32f9118deec5e1cef208fc0a5b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to 36469c4cabff11ae662e0f35135805e76bf569621f1496dddc2f4a4ace9b9abc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1750 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to 283af20cfc22770759320184e7b2e990f412533cba36bc4c50c66ecb04630310
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to d59eb63ca24dddec563a55f55628238a9a200b21424b68c701af78e8da030c66
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1759 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1761 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe systemd-1_252.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1764 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1766 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1767 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1768 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1769 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1770 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 1773 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1774 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1778 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1779 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1780 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_install: Succeeded
NOTE: Running task 1781 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot)
NOTE: Running task 1782 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1783 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot unihash changed to 5e4860fb310dc9d883107eb79a4b433f5d2fd8dfc49504417844c020b45c74c2
NOTE: Setscene tasks completed
NOTE: Running task 1784 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1785 tasks of which 1676 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata
Summary: There were 148 ERROR messages, returning a non-zero exit code.
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-src went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dbg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-staticdev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-doc went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-be went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-bg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-cs went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-da went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-de went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-es went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ga went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-gl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-he went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-hr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-id went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-it went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ja went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ko went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-lt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-nl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt-br went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ro went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ru went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sv went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-tr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-uk went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-vi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-cn went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-tw went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/1_2.74.5-r0/temp/log.do_packagedata.1969736
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata) failed with exit code '1'

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7be9bb0e489ee52cd116dbf7427aa89a1884a12c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 13 Mirrors 0 Missed 77 Current 418 (14% match, 84% complete)
Removing 23 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 14 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 448 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 889 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 1038 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1060 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1066 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/make/4.4-r0/temp/log.do_packagedata_setscene.1695041
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1185 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1186 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1205 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: Running task 1206 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 1261 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: Running task 1304 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1373 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1374 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1375 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1397 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1401 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1419 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_fetch)
NOTE: Running task 1540 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe strace-6.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1632 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 1633 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1635 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: Running task 1636 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1637 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: recipe strace-6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1638 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 1640 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 1642 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1644 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1645 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 1647 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: Running task 1648 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1649 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: Running task 1650 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1651 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1661 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1664 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 153f648d54c84d7cb8f7ea7012ff0b9db840baebc6f03abc9c63aa570b9775d3
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1671 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1672 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1673 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1674 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe strace-6.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: Running task 1675 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1677 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: Running task 1678 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe strace-6.2-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1680 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c6ab2bbb7247973f1dc35a2a0c6970ad3f6e794f36525bdae98d736d5108d206
NOTE: Running task 1686 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1688 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1689 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe strace-6.2-r0: task do_populate_lic: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.2.bb:do_populate_lic unihash changed to 02fa31cc1e7453197a6d88073ae8bece9b02f92461ad0f94dd82bf1c809e1798
NOTE: Running task 1690 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe strace-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1691 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1692 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1693 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1694 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1695 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot unihash changed to 08cfed561a9020e432b7ce10381e35488919d1d8d5c707841e4908a5ac951d69
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 492 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1696 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1697 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package unihash changed to 4f231d39dcb22992d0f7bef9daadea36f4e236d611ee80a891b18b0a0b630146
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Running setscene task 494 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot unihash changed to b7195d79ce0411b5554024bffa47f91d2e90637d3d9a2e2949aa63c4a019269c
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1731 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot unihash changed to 3281f31636120f9806841f0d9c81f97f97de0a66fbafb7a0c5df0c38541c8caa
NOTE: Setscene tasks completed
NOTE: Running task 1746 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package unihash changed to a80fcb58ce6c9206b96a987353c4e8ef0509ff155ee65de9c029b5ab8313762e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to b539f5e5330cf5a59d5ad31ca3e2ce384278d140a2f92649b0e9af6a6557675e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 507 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1750 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1754 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to e5c2fedc62776153030c7de8c7af18087477defa083b0efc0d808809990a9222
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to 8b45d0a6386c8795a855863b867582c5aa6836986cbd350eefce26a850d10097
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1759 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1761 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_compile)
NOTE: recipe systemd-1_252.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1764 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1766 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1767 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1768 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1769 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1770 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 1774 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_install: Succeeded
NOTE: Running task 1775 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot)
NOTE: Running task 1776 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 1778 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_populate_sysroot unihash changed to 355ef9d25d11336ed35734618764cd4347571200341e908ffe7e0fbdb6cab8ff
NOTE: Setscene tasks completed
NOTE: Running task 1779 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1780 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1781 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1784 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Failed
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1785 tasks of which 1676 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata
Summary: There were 148 ERROR messages, returning a non-zero exit code.
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-src went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dbg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-staticdev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-dev went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-doc went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-be went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-bg went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-cs went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-da went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-de went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-es went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-fr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ga went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-gl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-he went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-hr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-id went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-it went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ja went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ko went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-lt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-nl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pl went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-pt-br went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ro went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-ru went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-sv went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-tr went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-uk went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-vi went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-cn went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: QA Issue: Package version for package make-locale-zh-tw went backwards which would break package feeds (from 0:4.4.1-r0 to 0:4.4-r0) [version-going-backwards]
ERROR: make-4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.6-r0 to 1:2.74.5-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/1_2.74.5-r0/temp/log.do_packagedata.1773615
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata) failed with exit code '1'

--===============7537041586640472792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/status-detached-threads /usr/lib/strace/ptest/tests/status-successful-threads.test /usr/lib/strace/ptest/tests/status-detached-threads.test /usr/lib/strace/ptest/tests/status-successful-threads"

--===============7537041586640472792==--

