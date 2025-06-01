Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4704DC71149
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.27784.1748786124066601956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=u+nYuPaB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PA/GeHzG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc69eaa-e542e308-7c1c-4c77-aaff-0ef7dbaf4f02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cy1Ez+WkZGE56y3EqHwa8rksqUEGMakLVjY4HrZ7OK0=;
	b=u+nYuPaBZFPg0jS6AExY1eQkf7nYH/BFtZqmgL9SagQUutN502+iurJN3H83kEga
	4/UXI+cnBpiJKTxSahXUqspJcMbWUKXUjU5U5zPsE0mKHtPXc4/qpUvA9cKDz6NN4iE
	LmBFS1RgMEh3qJeRnyU1ZqE3d4McWmZXfPfga+v4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cy1Ez+WkZGE56y3EqHwa8rksqUEGMakLVjY4HrZ7OK0=;
	b=PA/GeHzGHdVvhwo/pZ52vzOqQnLLnFgKKiRx7GtLY/pSN3w4EGZeSQ2kBwdlFVEj
	RCk9UP4lBkfV6Mkc4KTUMAgZ+6n7xCcZoLdfaXgZuQwKhvy/gfGy3vinyn78FZMXCmu
	z/bQyjc2fP1OQy/Wv+p8sX86q2R9iN31RlSE3MCQ=
Content-Type: multipart/mixed; boundary="===============7913581723183388111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 14.0.2 FAILED
Message-ID: <010101972bc69eaa-e542e308-7c1c-4c77-aaff-0ef7dbaf4f02-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217569

--===============7913581723183388111==
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
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:deb9c3e041dfcf82d9ea54e062ed832493fb16af"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 875 Local 813 Mirrors 0 Missed 62 Current 497 (92% match, 95% complete)
Removing 4 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 514 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 522 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 540 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 543 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 546 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 552 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 561 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 610 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package_qa_setscene)
NOTE: Running setscene task 615 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_qa_setscene)
NOTE: Running setscene task 675 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 683 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1372 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_create_spdx_setscene)
NOTE: Running setscene task 697 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 702 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_package_qa_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hwdata-native-0.394-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 743 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 753 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 768 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 803 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 805 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 806 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 813 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 826 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 832 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 834 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 839 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 845 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 846 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 848 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 849 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 852 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 857 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe seatd-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1372 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 862 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 866 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 868 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 871 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx_setscene)
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 875 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe hwdata-native-0.394-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 880 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 883 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 884 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 889 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 890 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe hwdata-native-0.394-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 895 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 898 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.9.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 905 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 907 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 917 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 918 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 926 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-24.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 931 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 946 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 950 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1372 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/hwdata/hwdata_0.394.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 960 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 961 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 971 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 977 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hwdata-native-0.394-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 979 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 982 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hwdata-native-0.394-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 988 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 991 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 996 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1004 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1008 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1013 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1024 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1040 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1041 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1046 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1055 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1064 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1066 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1067 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1069 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1080 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1089 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1090 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1095 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1099 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1101 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1104 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1107 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1123 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1127 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1129 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1136 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1139 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1143 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1144 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1151 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1159 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1164 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe clang-20.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1170 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1171 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1177 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1187 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1188 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe clang-20.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1190 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1197 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1200 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1205 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe qemu-native-10.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1214 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1230 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-10.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1233 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1236 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1237 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1241 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1248 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1249 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1250 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1254 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1256 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1261 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1262 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1264 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1266 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1267 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1268 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1270 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1272 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1273 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1276 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1278 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1279 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1281 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1283 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1287 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1289 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1291 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1293 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-10.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-10.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1296 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2058 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: Running task 2234 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_fetch)
NOTE: Running task 2235 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: Running task 2316 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe clang-20.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1297 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1299 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2454 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_write_config)
NOTE: Running task 2455 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe clang-20.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2519 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 2520 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_fetch)
NOTE: Running task 2522 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1304 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: Running setscene task 1305 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2579 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_fetch)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2608 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_fetch)
NOTE: Running task 2609 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_fetch)
NOTE: Running task 2610 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_fetch)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_fetch: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_fetch: Started
NOTE: recipe pango-1.56.3-r0: task do_fetch: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_fetch: Started
NOTE: Running setscene task 1307 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1308 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1310 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1311 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running task 2682 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_write_config)
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.0-r0: task do_write_config: Started
NOTE: Running task 2716 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1313 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-11.2.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1314 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1317 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1318 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe weston-14.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1319 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1325 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1326 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.56.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1331 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1334 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1336 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1338 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1341 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1343 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1344 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1346 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1348 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1349 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1350 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1351 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.9.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1354 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1355 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1356 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1359 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1360 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1361 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1363 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1367 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1368 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1369 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1371 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1372 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 3111 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: Running task 3147 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3183 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 3202 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_unpack)
NOTE: Running task 3203 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_unpack)
NOTE: Running task 3204 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 3226 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_write_config)
NOTE: Running task 3230 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3238 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: Running task 3246 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_unpack)
NOTE: Running task 3247 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.3-r0: task do_unpack: Started
NOTE: recipe seatd-0.9.1-r0: task do_unpack: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_unpack: Started
NOTE: Running task 3258 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_unpack)
NOTE: Running task 3260 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_write_config)
NOTE: recipe xwayland-24.1.6-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 3261 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_write_config)
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_write_config: Succeeded
NOTE: Running task 3262 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3263 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.3-r0: task do_write_config: Started
NOTE: recipe weston-14.0.1-r0: task do_unpack: Started
NOTE: recipe seatd-0.9.1-r0: task do_write_config: Started
NOTE: recipe pango-1.56.3-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3264 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_write_config)
NOTE: Running task 3265 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 3266 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_patch)
NOTE: recipe seatd-0.9.1-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 3267 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-24.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 3289 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_unpack)
NOTE: Running task 3290 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_write_config: Started
NOTE: recipe pango-1.56.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3293 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_patch)
NOTE: Running task 3302 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe xwayland-24.1.6-r0: task do_unpack: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3332 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_patch)
NOTE: recipe seatd-0.9.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3343 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running task 3377 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_write_config)
NOTE: recipe weston-14.0.1-r0: task do_patch: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_patch: Started
NOTE: recipe weston-14.0.1-r0: task do_patch: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 3390 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe xwayland-24.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 3404 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_patch)
NOTE: recipe weston-14.0.1-r0: task do_write_config: Started
NOTE: Running task 3425 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 3426 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_patch)
NOTE: recipe weston-14.0.1-r0: task do_write_config: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.6-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 3568 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: Running task 3570 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: Running task 3588 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_collect_spdx_deps)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3589 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3590 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: Running task 3592 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_configure)
NOTE: Running task 3594 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3595 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb:do_patch)
NOTE: recipe seatd-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_configure: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-11.2.0-r0: task do_patch: Started
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_patch: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3600 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3602 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure)
NOTE: Running task 3604 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_ipk)
NOTE: recipe harfbuzz-11.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3605 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_deb)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.9.1-r0: task do_patch: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_configure: Started
NOTE: recipe xwayland-24.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb: Started
NOTE: recipe xwayland-24.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3615 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3616 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe xwayland-24.1.6-r0: task do_configure: Started
NOTE: recipe seatd-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3617 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe seatd-0.9.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3619 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 3620 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: Running task 3621 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 3622 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_patch)
NOTE: Running task 3623 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Started
NOTE: Running task 3624 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: Running task 3625 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3626 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_compile)
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 3628 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_configure)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_compile: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_ipk unihash changed to a666a0e08f46c4bdeef9d7970bc6423f011f59664c4ab83c4250c4e4bf81d2e7
NOTE: recipe weston-init-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_deb unihash changed to 99ccf8b411a91da3a1107185a36b9ff72170b10dfe1cb14fae7bcb0c29e4ab6a
NOTE: recipe seatd-0.9.1-r0: task do_configure: Succeeded
NOTE: Running task 3629 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_compile)
NOTE: recipe seatd-0.9.1-r0: task do_compile: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3630 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure_ptest_base)
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 3631 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: Running task 3632 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3633 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_install)
NOTE: recipe libinput-1.28.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 3634 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe seatd-0.9.1-r0: task do_compile: Succeeded
NOTE: Running task 3635 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3636 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata unihash changed to db8c8a7e08e3f2ae7cd25cc0df2535fb67040087a8843ff03b97a4cd57534e14
NOTE: Setscene tasks completed
NOTE: Running task 3637 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe seatd-0.9.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_install: Succeeded
NOTE: Running task 3638 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_package)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 3640 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe seatd-0.9.1-r0: task do_install: Succeeded
NOTE: Running task 3641 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package)
NOTE: Running task 3642 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_populate_sysroot)
NOTE: recipe seatd-0.9.1-r0: task do_package: Started
NOTE: recipe seatd-0.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 3643 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe seatd-0.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libdisplay-info-0.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_package unihash changed to 70149b4a6149ede6b928bb2cb3c5e42e37cc531f650b12c8af970c59c12eb1f4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_packagedata became valid
NOTE: Running setscene task 1372 of 1372 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_packagedata_setscene)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3646 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_create_spdx)
NOTE: recipe xwayland-24.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3647 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb:do_compile)
NOTE: recipe libdisplay-info-0.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.6-r0: task do_compile: Started
NOTE: recipe libdisplay-info-0.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3648 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3649 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install)
NOTE: recipe libinput-1.28.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 3650 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3651 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe libinput-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3652 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3653 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_package)
NOTE: Running task 3654 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.28.1-r0: task do_package: Started
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 3655 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3656 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: Running task 3657 of 3737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.9.1-r0: task do_package: Failed
NOTE: recipe libinput-1.28.1-r0: task do_package: Succeeded
NOTE: recipe xwayland-24.1.6-r0: task do_compile: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 3657 tasks of which 3560 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601071840.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601071840.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/seatd/0.9.1/temp/log.do_package.2429438
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd. 
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/seatd/0.9.1/temp/log.do_package.2429438
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.9.1.bb:do_package) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7913581723183388111==--

