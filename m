Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E8BC3ABBF
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1782.1746113612990327236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L+uS6I3C;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GKL32cU2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b4985-8a5a8b49-7b8d-4155-9b7c-8dbb14cf5469-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NPaDR1LKbb/+to6r3G/sjw798yO+Fp1Nyo+ijo5xjw8=;
	b=L+uS6I3CU09LIfmMg/2dX60g8IpwPhyMf0XvFmvKMPgIyKuPrNguOHNvEjRv1ttG
	b6lc/1Gn0KKZvdGFDnrZes4t7DW3SLaFbFza9EdDJNNebOFuF48odazfR4ciZ0GbDPB
	B3oacFz1th8HRc7fbnt0VR/VhJnj0vxefAY0DLV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NPaDR1LKbb/+to6r3G/sjw798yO+Fp1Nyo+ijo5xjw8=;
	b=GKL32cU20PAO7KAPme6Y9NDq/5zhJ1MW38qByH2Er9oxviKFYFjlLEe/6hCjG+a2
	lm1ZLlnG/8qLNKkeEmR4V27nCdgn/K9imjROJCU/mER4S3yRF6XnCsGGNBso4nojlWI
	puoWd9HBH+eg9swcnsyDIAGnnxsAURSORz4e6Exg=
Content-Type: multipart/mixed; boundary="===============8344881042764473439=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 14.0.2 FAILED
Message-ID: <010101968c7b4985-8a5a8b49-7b8d-4155-9b7c-8dbb14cf5469-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215791

--===============8344881042764473439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *14.0.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake weston' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:81c9fe2b57212cbfbc48c9ace3231a0e7ab91fbe"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 779 Local 720 Mirrors 0 Missed 59 Current 564 (92% match, 95% complete)
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 579 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 580 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 581 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 585 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 655 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 685 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_qa_setscene)
NOTE: Running setscene task 689 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 690 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package_qa_setscene)
NOTE: Running setscene task 713 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 728 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 746 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 775 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1343 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package_qa_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 799 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 808 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 818 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 819 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 823 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 828 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 836 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe hwdata-native-0.394-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 840 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 843 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 858 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 860 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 868 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 869 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 880 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 884 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 886 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 897 of 1343 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 905 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 907 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: recipe kbd-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 911 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe hwdata-native-0.394-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 916 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 918 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 921 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 926 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 934 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 935 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 938 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 950 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1343 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 955 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 956 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 968 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 971 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 978 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 981 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 989 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 991 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 992 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 995 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 997 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1002 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1008 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1012 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1014 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1018 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1021 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1024 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1025 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1026 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1028 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 1035 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1037 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1039 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1045 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1047 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1051 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1052 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1053 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1058 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1062 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1072 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_setscene)
NOTE: Running setscene task 1074 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1081 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1084 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_package_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1096 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1099 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1106 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1109 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1112 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1120 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1123 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1124 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1125 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1131 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1135 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1142 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1144 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1146 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1147 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1151 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1160 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1165 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1169 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1171 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package_setscene)
NOTE: Running setscene task 1173 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1174 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1181 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1186 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1204 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1205 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1209 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1215 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1231 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1242 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1245 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1246 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1248 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1249 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1252 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1260 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1261 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1262 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1265 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1266 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1271 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1272 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1275 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1278 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1280 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1282 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1284 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1286 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1289 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1291 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1292 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1296 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1304 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1306 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1310 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1311 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1313 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1315 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1316 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1318 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-9.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-9.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1326 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1328 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-9.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1335 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1338 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1341 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1343 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2371 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 2555 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: Running task 2556 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_fetch)
NOTE: Running task 2565 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: Running task 2671 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 2809 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: Running task 2810 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_write_config)
NOTE: Running task 2817 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: Running task 2897 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_fetch)
NOTE: Running task 2898 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: Running task 2969 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_fetch: Started
NOTE: Running task 3014 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_fetch)
NOTE: Running task 3016 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_fetch)
NOTE: Running task 3017 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_fetch)
NOTE: recipe xwayland-24.1.6-r0: task do_fetch: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.9.1-r0: task do_fetch: Started
NOTE: recipe pango-1.56.3-r0: task do_fetch: Started
NOTE: Running task 3103 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_write_config)
NOTE: Running task 3112 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_fetch)
NOTE: Running task 3124 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_write_config)
NOTE: Running task 3132 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 3151 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_write_config)
NOTE: Running task 3153 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_write_config)
NOTE: Running task 3154 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_write_config)
NOTE: recipe harfbuzz-11.1.0-r0: task do_write_config: Started
NOTE: recipe weston-14.0.1-r0: task do_fetch: Started
NOTE: recipe xwayland-24.1.6-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_write_config: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_write_config: Started
NOTE: recipe pango-1.56.3-r0: task do_write_config: Started
NOTE: recipe xwayland-24.1.6-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_write_config: Started
NOTE: Running task 3184 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_write_config: Succeeded
NOTE: Running task 3231 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_write_config)
NOTE: recipe seatd-0.9.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 3257 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: Running task 3258 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running task 3287 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-14.0.1-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 3306 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: Running task 3315 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 3322 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-14.0.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 3323 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.7.1-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.3-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 3499 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 3503 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_ipk)
NOTE: Running task 3504 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 3505 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.3-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 3506 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_patch)
NOTE: Running task 3507 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: Running task 3508 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe pango-1.56.3-r0: task do_patch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe kbd-2.7.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 3509 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_unpack)
NOTE: recipe pango-1.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3511 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 3512 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_unpack)
NOTE: recipe seatd-0.9.1-r0: task do_unpack: Started
NOTE: recipe seatd-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_unpack: Started
NOTE: recipe kbd-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 3513 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3514 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_patch)
NOTE: Running task 3515 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3516 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_deb)
NOTE: recipe weston-14.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3517 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_patch: Started
NOTE: Running task 3518 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb: Started
NOTE: recipe weston-14.0.1-r0: task do_unpack: Started
NOTE: Running task 3520 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 3532 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_patch)
NOTE: Running task 3533 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3534 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_patch)
NOTE: Running task 3535 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe seatd-0.9.1-r0: task do_patch: Started
NOTE: recipe weston-14.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 3536 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_patch)
NOTE: Running task 3537 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe seatd-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3538 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_patch: Started
NOTE: Running task 3539 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-14.0.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3540 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-14.0.1-r0: task do_patch: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 3541 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3542 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Started
NOTE: Running task 3543 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3544 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe harfbuzz-11.1.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3546 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_configure)
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Started
NOTE: Running task 3548 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe xwayland-24.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_configure: Started
NOTE: Running task 3549 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3550 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_unpack: Started
NOTE: Running task 3552 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: Running task 3553 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3554 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_configure)
NOTE: recipe seatd-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe seatd-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 3555 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Running task 3557 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.6-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: Running task 3558 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_patch)
NOTE: recipe kbd-2.7.1-r0: task do_configure: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-24.1.6-r0: task do_patch: Started
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 3559 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_patch)
NOTE: recipe xwayland-24.1.6-r0: task do_patch: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 3560 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3561 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_configure)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_ipk unihash changed to a666a0e08f46c4bdeef9d7970bc6423f011f59664c4ab83c4250c4e4bf81d2e7
NOTE: Running task 3562 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.28.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 3563 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe seatd-0.9.1-r0: task do_configure: Started
NOTE: Running task 3564 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3565 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_populate_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 3567 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_patch)
NOTE: Running task 3568 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_deploy_source_date_epoch unihash changed to e6a0eccc5fd7be84309e462d9968748913e79b895960d1928505eedd99234ce1
NOTE: recipe harfbuzz-11.1.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_deb unihash changed to 99ccf8b411a91da3a1107185a36b9ff72170b10dfe1cb14fae7bcb0c29e4ab6a
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.28.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3570 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure)
NOTE: recipe harfbuzz-11.1.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3572 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_configure)
NOTE: recipe xwayland-24.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3573 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-11.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_configure: Started
NOTE: recipe xwayland-24.1.6-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3574 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_compile)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 3575 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.9.1-r0: task do_configure: Succeeded
NOTE: Running task 3576 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3577 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe seatd-0.9.1-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3578 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_install)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe seatd-0.9.1-r0: task do_compile: Succeeded
NOTE: Running task 3580 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3581 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe libinput-1.28.1-r0: task do_configure: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_install: Started
NOTE: Running task 3582 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3583 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_package)
NOTE: recipe libinput-1.28.1-r0: task do_compile: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_package: Started
NOTE: recipe seatd-0.9.1-r0: task do_install: Succeeded
NOTE: Running task 3586 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package)
NOTE: Running task 3587 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_populate_sysroot)
NOTE: recipe seatd-0.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.9.1-r0: task do_package: Started
NOTE: recipe seatd-0.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_package unihash changed to 34b8392cc93fae292193ae3825e44273d232253ea871ff76a9b5990b75397a95
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_packagedata became valid
NOTE: Running setscene task 1343 of 1343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_packagedata_setscene)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3589 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_create_spdx)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3590 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_compile)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_compile: Started
NOTE: recipe xwayland-24.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_compile)
NOTE: recipe xwayland-24.1.6-r0: task do_compile: Started
NOTE: recipe libinput-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3592 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 3593 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3594 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: Running task 3595 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe libinput-1.28.1-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libinput-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3597 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3598 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_package)
NOTE: Running task 3599 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.28.1-r0: task do_package: Started
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 3600 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3659 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe seatd-0.9.1-r0: task do_package: Failed
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: recipe kbd-2.7.1-r0: task do_configure: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_package: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3601 tasks of which 3493 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501064955.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501064955.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/seatd/0.9.1/temp/log.do_package.708840
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd. 
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/seatd/0.9.1/temp/log.do_package.708840
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8344881042764473439==--

