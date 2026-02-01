Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44901E6BF3C
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29053.1769951564839847440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2Tv61QaB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HYGehf4T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955c209-4d4efc14-87bf-4517-b31f-2aa37ff01735-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iBBKEvLiw5twsNUyR3okgMX4mbD6sldue3vojgYae0E=;
	b=2Tv61QaBASPtCh+0s6m0KHTNOTt5Jhpso8FbNrbnlv37Guj7PNjEmQ7qzdwJb7E4
	8J0mfKd0SVArBY101jWhnHAOO2+oBW9s2cX/V8D/7qvTg/A9vk30UIU5vddCpy9/NiX
	MQZRXqMDnhjHNN49HbxutampVwXFzOHwpJUl9yXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iBBKEvLiw5twsNUyR3okgMX4mbD6sldue3vojgYae0E=;
	b=HYGehf4T+OfyI9bHEvbgUdCmq396eT1dbyK6R1JXlQRHMQydKe7cHoKXc67Kty8I
	vj03oNM5Nd0ApjevUj2zWRTHmJE6ugpqq/eohRZK4DBURp/tQd8KJRoVKUaVRTIyGKz
	3/10l4LPqSR4YZNeuM81kEQ/0NqeaVwFgGJTyfos=
Content-Type: multipart/mixed; boundary="===============6186019831583817619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.20.3 SUCCEEDED
Message-ID: <0101019c1955c209-4d4efc14-87bf-4517-b31f-2aa37ff01735-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230313

--===============6186019831583817619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.2-4.20.3.patch
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
From a0f74b596f5a48a0873c062d7a96f1334fdd92d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 11:05:53 +0000
Subject: [PATCH] gtk4: upgrade 4.20.2 -> 4.20.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index 92791db169..ef9a05f7fe 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============6186019831583817619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============6186019831583817619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1958 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-5d89b3e09645743c9e8e2424e65df751c4e6f969"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:5d89b3e09645743c9e8e2424e65df751c4e6f969"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 969 Local 653 Mirrors 0 Missed 316 Current 461 (67% match, 77% complete)
done.
Removing 12 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 481 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 504 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 506 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 524 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 570 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 576 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 589 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 661 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 674 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 679 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 699 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 710 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo-c_0.10.19+cargo-0.93.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 765 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_populate_sysroot_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 795 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 802 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 813 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_package_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-c-native-0.10.19+cargo-0.93.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.19+cargo-0.93.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 845 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 864 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 877 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 888 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 896 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 910 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 911 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 918 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-native-78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 919 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 923 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 932 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 934 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe icu-native-78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 952 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1001 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1010 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1035 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1041 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1044 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1045 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1052 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1059 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1062 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1069 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1076 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1082 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1088 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1091 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1096 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1106 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1108 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1109 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1111 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1114 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1117 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1122 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1125 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1126 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1133 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1145 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1149 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1150 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1151 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1152 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1153 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1154 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1158 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1163 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1165 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1167 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1168 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1172 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1173 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1178 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1179 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1180 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1183 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1184 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1189 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1190 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1191 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1193 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1195 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1197 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1203 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1205 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1206 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1209 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1212 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1213 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1215 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1218 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1219 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1220 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1225 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1228 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1229 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_setscene)
NOTE: Running setscene task 1231 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1239 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1241 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1247 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1249 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1250 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1251 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1252 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1254 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1255 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1256 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1257 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1258 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 850 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 948 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 987 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1266 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1270 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Started
NOTE: Running setscene task 1272 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1274 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1276 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_unpack)
NOTE: Running task 1031 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1033 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_fetch)
NOTE: Running task 1036 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe icu-78.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1128 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1149 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_unpack)
NOTE: Running task 1150 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: Running task 1151 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_write_config)
NOTE: Running task 1152 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1188 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1284 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1256 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: Running task 1260 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: Running task 1262 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_fetch)
NOTE: Running task 1263 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_recipe_qa)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: Running task 1264 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1265 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: Running task 1267 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: recipe harfbuzz-12.3.1-r0: task do_recipe_qa: Started
NOTE: Running task 1270 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 1278 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1295 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1297 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1298 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: Running task 1323 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1325 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running task 1334 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: recipe harfbuzz-12.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_unpack: Succeeded
NOTE: Running task 1335 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_fetch)
NOTE: Running task 1336 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: Running task 1337 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1338 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-12.3.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1340 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1352 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Running task 1354 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-12.3.1-r0: task do_unpack: Started
NOTE: Running task 1355 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: Running task 1356 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Started
NOTE: Running task 1361 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: Running task 1363 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1364 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1366 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_generate_toolchain_file)
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1377 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch unihash changed to 6a4475f06882380a44febcabc2ca80e2943490ce4efa213da59b705b22ec2f64
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7ded34245bf77865bc34c163a9abcd0b5d45dd31eb78bb63d78cb63d22fb4e0d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 7ded34245bf77865bc34c163a9abcd0b5d45dd31eb78bb63d78cb63d22fb4e0d -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '01470c6d19f1256ad32e31adaf26a9c112a67bf9774b7d654318d37939bf8da5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 01470c6d19f1256ad32e31adaf26a9c112a67bf9774b7d654318d37939bf8da5 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch unihash changed to 77c11bfabcbdeab15657e3932df82c21aec1592b1dc9af3c7f4a48af2468cbd5
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a7010b0f6072df983a56053e7a033eb8514ff7a5651139ac90836c2dfa9ea757', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed a7010b0f6072df983a56053e7a033eb8514ff7a5651139ac90836c2dfa9ea757 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'af1b692b5d954f613acb955a7cf919e9d2b2efc0d3c09b34ccb77fe4833e217d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed af1b692b5d954f613acb955a7cf919e9d2b2efc0d3c09b34ccb77fe4833e217d -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch unihash changed to 8fb01876969a4a9804fe4db0071118a83ef3fb8081f6bfb9c30c1a340bac5a4b
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5e755429daee40dc109fab33de7d901c5c60ee405f8c5f387de1dd9546a3e238', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 5e755429daee40dc109fab33de7d901c5c60ee405f8c5f387de1dd9546a3e238 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f6d4d781e019e8ce930e9c603f2759a2a15be3807b22dab1f643153208d56e3b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed f6d4d781e019e8ce930e9c603f2759a2a15be3807b22dab1f643153208d56e3b -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe harfbuzz-12.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_patch)
NOTE: Running task 1401 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: Running task 1402 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1404 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1432 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_fetch)
NOTE: Running task 1436 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1438 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_fetch)
NOTE: Running task 1441 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.1-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-12.3.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1447 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1448 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: Running task 1450 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 1452 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: Running task 1455 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch unihash changed to 95d7544dfcbfbf269c643b31dc30b5166ec7a6615f45a61d1a5a54b123a58ea9
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b137c8b63925067d178fe47a08d21a0c18d15b97cbd5961ba6b00842c9373216', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed b137c8b63925067d178fe47a08d21a0c18d15b97cbd5961ba6b00842c9373216 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '557dc2f73e1d4d97ed00780f51a3c223c875d609f11202c953a037f22327d86b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 557dc2f73e1d4d97ed00780f51a3c223c875d609f11202c953a037f22327d86b -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-12.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch unihash changed to 136350031d83ff80d2178fe7f5bb53f40f8ba9323098440c9eeaf382a9eb415c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch unihash changed to bb1ba8e913f38953c8512d41b8ddf04bef8b64cb33950078fa49075fbce4713a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f997476a60420fe9eb5a5e41ed7eaf4896c1654f5025963ed16de1bf239f76f3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed f997476a60420fe9eb5a5e41ed7eaf4896c1654f5025963ed16de1bf239f76f3 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '95d777001884559eb9d18dc3814ea70e39626728e6489fe320c4ec74157f7a56', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 95d777001884559eb9d18dc3814ea70e39626728e6489fe320c4ec74157f7a56 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 1457 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: Running task 1458 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1459 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb:do_write_config)
NOTE: Running task 1460 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: Running task 1463 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: Running task 1468 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe harfbuzz-12.3.1-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1474 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-12.3.1-r0: task do_write_config: Succeeded
NOTE: Running task 1475 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1507 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: Running task 1508 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1aca240bf0c99bd054e3fcb8676040d189e03497238ad918ed554a9260628b38', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 1aca240bf0c99bd054e3fcb8676040d189e03497238ad918ed554a9260628b38 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '225c0cfee5f8cbdfd004c4a4b40d0a101fd1b94ba3105ce24cf21de217cff674', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 225c0cfee5f8cbdfd004c4a4b40d0a101fd1b94ba3105ce24cf21de217cff674 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch unihash changed to 66162152275d4d00e1507c398cfb40a19256a828e574051913476ae0a30aa314
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch unihash changed to 15d7b5ec5c0157fddbf26dbd335cfdfa6dbc9919542be9ee7c10e7317684fc5c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'fcb20aef14e3e30b62cc91526a625efa5e03ffd086a0cecbfc03fec077438ef0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed fcb20aef14e3e30b62cc91526a625efa5e03ffd086a0cecbfc03fec077438ef0 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7d2cbb00daf253c2b88238a1d17b36c2c5dac59619d2861e4e5a000fd493e2bf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 7d2cbb00daf253c2b88238a1d17b36c2c5dac59619d2861e4e5a000fd493e2bf -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0e6015de34d036a4ea54a164f1c38c434a6322354901709d1006bda03b262422', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 0e6015de34d036a4ea54a164f1c38c434a6322354901709d1006bda03b262422 -> 924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1242 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1249 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1272 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1281 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running task 1510 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1511 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1291 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1512 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1297 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1298 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch unihash changed to 4f87b95c7a8ad4b919a32427c5c185814d24cbb2811eb8ef8144c7d471e28818
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'dd7cc7cb3e070181939d747c8bbf0115b32b5e73a7090e1f15b4a0134dcb6cb0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed dd7cc7cb3e070181939d747c8bbf0115b32b5e73a7090e1f15b4a0134dcb6cb0 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'bbbaf6c1af2648a2e23f1a138f97f3b623e690b17ddbacd94395e17a798193a7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed bbbaf6c1af2648a2e23f1a138f97f3b623e690b17ddbacd94395e17a798193a7 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1251 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running task 1548 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_unpack)
NOTE: Running task 1562 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1563 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1564 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_unpack)
NOTE: Running task 1565 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.1-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1308 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1571 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1310 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1311 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running setscene task 1312 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1313 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1315 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1316 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1317 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1319 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1319 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1320 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1323 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1325 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1326 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1333 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1334 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1336 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1338 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1339 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1341 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1348 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1349 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1353 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1358 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1360 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1366 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1369 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1370 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1372 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1375 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1379 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1380 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1381 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1382 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1385 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1386 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1613 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1624 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 1625 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_patch)
NOTE: Running setscene task 1388 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1631 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1663 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Running task 1664 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: Running task 1667 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Running task 1668 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: Running task 1669 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1389 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1390 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1392 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1698 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: Running setscene task 1394 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1727 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: Running task 1734 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: Running task 1735 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: Running task 1739 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 1742 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Succeeded
NOTE: Running task 1759 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1764 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 1396 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1765 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1398 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1399 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1766 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1779 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1780 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_fetch)
NOTE: Running setscene task 1401 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1781 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1787 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1793 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-78.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: Running task 1799 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_write_config)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Started
NOTE: Running task 1800 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 1801 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.85-r0: task do_fetch: Succeeded
NOTE: Running task 1802 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: Running task 1804 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch unihash changed to 8479bb1972e513200c6209bd0a25590133fdf26dc9d3921b11b55a26f01c9cad
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd11a49389a9fe0f1d2383e4d47e05397bd699f1a40feffcc45313397aa59e54a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed d11a49389a9fe0f1d2383e4d47e05397bd699f1a40feffcc45313397aa59e54a -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'e9c5fdbd2f5cba7ed618d5e6d7c39e1f027e085a95903678ecede9450d9ebfa3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed e9c5fdbd2f5cba7ed618d5e6d7c39e1f027e085a95903678ecede9450d9ebfa3 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-78.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch unihash changed to 7a777afe2b2bd2ec4761efac747a1fff1264ccf631ba01527187b017f3332641
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch unihash changed to 3fd4a896fda0a1ee68a8eb24ebf2892c7ac55e8f43dfb6a5df1901c00bf29e16
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 81de8e60a1bf2846df8c4c458d533515b1a6589dc61c6b298c0be1d3418b4ebb
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '425ab4179760b02b1dd0333786a750458cdb0aa2bb96ade3fd1d44ce39ea4662', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 425ab4179760b02b1dd0333786a750458cdb0aa2bb96ade3fd1d44ce39ea4662 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd22b83427b48f161e46f6be394aa7ecba8d088f028ecf55b3efb9150d16511a9', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed d22b83427b48f161e46f6be394aa7ecba8d088f028ecf55b3efb9150d16511a9 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1351 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1406 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1805 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1806 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: Running task 1807 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_write_config)
NOTE: Running task 1808 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1809 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1811 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1821 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1822 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1823 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-78.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 1840 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: Running task 1846 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1408 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1409 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_deploy_source_date_epoch unihash changed to 6e0c042d451370afe27fc9479c9ae59a029e45e7f074866d20dc3ea72a3bdfa4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch unihash changed to e1932274068ed3fc54692b6e11f2f2059eb9298d2ad67aab7ab732b53089d4d9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch unihash changed to 7c6d6775f4b2b53e37b94ab9a22cf7c5eb22076d504e4a602b21a96089c116b7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch unihash changed to 259e1a68594b203d41d05858b12399825ddf0278e969b5b5c970186445d2322c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch unihash changed to a2ac6d6f10409de31aa12966f1d633a87337dc428638fb96e18bbb0f0577e93f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch unihash changed to 9814a41b7179440ccb5ba998fb1f55e7662bd1f0b6f33ef8b014c0bc9ff22570
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '938b6b61afe9b0f56732eba6fe1fb52b178898e774786fe275b49513b00cc2ff', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 938b6b61afe9b0f56732eba6fe1fb52b178898e774786fe275b49513b00cc2ff -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f0954ab8ae509f6a381b585e25d90500aef2425576a70af0a200fb6ccb7bd508', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed f0954ab8ae509f6a381b585e25d90500aef2425576a70af0a200fb6ccb7bd508 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1307 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1309 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1847 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1848 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: Running task 1850 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_unpack)
NOTE: Running task 1852 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_patch)
NOTE: Running task 1861 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1862 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Started
NOTE: Running task 1969 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_fetch)
NOTE: recipe bluez5-5.85-r0: task do_unpack: Started
NOTE: Running task 1971 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: Running task 1987 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1991 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1999 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 2006 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: Running task 2007 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_fetch: Started
NOTE: Running task 2008 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1417 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1418 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_patch: Started
NOTE: recipe bluez5-5.85-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1419 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1424 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2020 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1426 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_unpack)
NOTE: recipe bluez5-5.85-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch unihash changed to c1eecc43650ea01d8c3a6a27fee78b4da6061c95264b05dee8c0e0b53747141b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch unihash changed to bb69d8504028f62355bcd68943f46e9764665d6a564c392585eefd519ce3ba60
NOTE: recipe mesa-2_25.3.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1401 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1404 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 2032 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: Running task 2033 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: Running task 2034 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_deploy_source_date_epoch)
NOTE: Running task 2035 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_unpack)
NOTE: Running task 2037 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: Running task 2038 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 2040 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: Running task 2042 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running task 2043 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2055 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_unpack: Started
NOTE: recipe bluez5-5.85-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_25.3.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_write_config: Succeeded
NOTE: Running task 2286 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2343 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.46-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 2476 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_patch)
NOTE: Running task 2477 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2479 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2481 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2485 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to 21d7fe10a73a90258e3fe263e6a9e6883164ffce7120dc95dcbe90b8585db894
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'dba4dbb6303a8787870e08126d35d72e2a8bcc824898906b649c33b92c88eb5b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed dba4dbb6303a8787870e08126d35d72e2a8bcc824898906b649c33b92c88eb5b -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a9da39ca5ccf78485347f847f37a019e2066fa046e7621645f1daadc46e20fe5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed a9da39ca5ccf78485347f847f37a019e2066fa046e7621645f1daadc46e20fe5 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.85-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_deploy_source_date_epoch unihash changed to 834db516ae59d8bf86bfff2f4e63419dd1eb41f8cbf85d54d69eb7a9b1bcb0ed
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure)
NOTE: Running task 2498 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2517 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2521 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_make_icudata)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2524 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2525 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe icu-78.1-r0: task do_make_icudata: Started
NOTE: Running task 2526 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: recipe icu-78.1-r0: task do_make_icudata: Succeeded
NOTE: Running task 2527 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2528 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe icu-78.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2529 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_deploy_source_date_epoch unihash changed to 3bfb124588dbe043cecdd613c429e87063776d4af34c6ab0bbf755c37d551aba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'fa9bba7b6accd32972598e8e9567a915784895ab041c2b1f3c22992e473c8cf5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed fa9bba7b6accd32972598e8e9567a915784895ab041c2b1f3c22992e473c8cf5 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c2b778551206a8994f7489b683747d218c12b27f041d6203ec9efd53a41294b1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed c2b778551206a8994f7489b683747d218c12b27f041d6203ec9efd53a41294b1 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2530 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: Running task 2531 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: Running task 2532 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: Running task 2533 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2534 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2535 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2536 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 2537 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2538 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 2540 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2541 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_unpack)
NOTE: Running task 2542 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2543 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: Running task 2545 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2547 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_deploy_source_date_epoch unihash changed to 76a8ea67060c31f2a8f9baac14dc7a43804f2e8d4b1c19ce9465141f2199afa3
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'aca69ac66e2c7b4f53569d1d3d50ab55abb878518c70992f4b7f5c3751086568', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed aca69ac66e2c7b4f53569d1d3d50ab55abb878518c70992f4b7f5c3751086568 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9a5bf7c487f4b64b7f86621c9c64ffe236383a6b7fc096651a94ca4ed18a99f9', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9a5bf7c487f4b64b7f86621c9c64ffe236383a6b7fc096651a94ca4ed18a99f9 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2548 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2549 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: Running task 2556 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: Running task 2557 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 2561 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2562 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2563 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2564 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Running task 2565 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: Running task 2566 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_compile: Started
NOTE: Running task 2606 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_compile: Succeeded
NOTE: Running task 2607 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_install)
NOTE: recipe xkeyboard-config-2.46-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_patch: Succeeded
NOTE: Running task 2611 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 2612 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2613 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to c6da990740b278d4e71e1b61d28976c22527c9e6c0436def79f58ecb2686c7ef
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7827aee37be4e523d67b28d273726b78b0f71275277dfd2864c67f7b719cc772', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 7827aee37be4e523d67b28d273726b78b0f71275277dfd2864c67f7b719cc772 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9e925d57abcc1c6c14e3e82474fdcd01c179d1c0167677d640962b2ee006ec1a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9e925d57abcc1c6c14e3e82474fdcd01c179d1c0167677d640962b2ee006ec1a -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch unihash changed to eacb331d9d5e419a6a0e22481adfd54328191ccc169530c082682382abd64f0f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4dd3c34a5890bab305a8b4b0d79ab0ab57ac069ac188cbd75df1445f6c7d7dc6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 4dd3c34a5890bab305a8b4b0d79ab0ab57ac069ac188cbd75df1445f6c7d7dc6 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd745c0dd3db14c02187a9ab8cae63e8da7a62111662c04cb42abd75931f8b601', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed d745c0dd3db14c02187a9ab8cae63e8da7a62111662c04cb42abd75931f8b601 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2614 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_populate_sysroot)
NOTE: Running task 2615 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2616 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 2617 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: Running task 2620 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot unihash changed to f8c922af7a0b132e51bb5451d4bfcbbd5d8dac597c6d5154d304ee812d46e505
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f563f7db7689b7ce35d50deb3dec3223509f9720cb9512b475a22e18f680cdd2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed f563f7db7689b7ce35d50deb3dec3223509f9720cb9512b475a22e18f680cdd2 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6a16e3cb082f336b44659fa511553ac2a6a5e09e97b0cc982ce3cf069b5aed27', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 6a16e3cb082f336b44659fa511553ac2a6a5e09e97b0cc982ce3cf069b5aed27 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2642 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2644 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-78.1-r0: task do_configure: Succeeded
NOTE: Running task 2645 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_configure_ptest_base)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_populate_sysroot unihash changed to 8962469d6baae8128e92db834fce4610b435b4bab58f1cc7c226e7b1692faec6
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6fd4f6482a72394987fc8437710ad14cb37e6c9647e3eb537f533fffe60a31d1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 6fd4f6482a72394987fc8437710ad14cb37e6c9647e3eb537f533fffe60a31d1 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '44a13c9d16a91af62e3da47d9afe22d027fd9952da6fb37a55ab45abf8b220e2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 44a13c9d16a91af62e3da47d9afe22d027fd9952da6fb37a55ab45abf8b220e2 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Succeeded
NOTE: recipe icu-78.1-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-78.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: Setscene tasks completed
NOTE: Running task 2646 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_install)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 2647 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_compile)
NOTE: Running task 2648 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_configure)
NOTE: Running task 2649 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2651 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: Running task 2652 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: Running task 2653 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Started
NOTE: recipe icu-78.1-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2655 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2656 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch unihash changed to a43a08ece7e6936d9ec387b5e07db4ea8a47a7d11000e0febd5d481489cd481b
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Succeeded
NOTE: Running task 2657 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot)
NOTE: Running task 2658 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2659 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 5a8a41f8a0ebb4d183bb4c286549ae2a93d66db6542d3f0fe93ba245cb72001a
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2664 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_package: Succeeded
NOTE: Running task 2671 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_package unihash changed to bdde3ad009f640a0ea35e787170f0e77e9a874f7438d6bc2ec35846fccc28a26
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '244a0a9cabc31cd6921820330c7ac646ae799361ef826d0d092e27493203be51', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 244a0a9cabc31cd6921820330c7ac646ae799361ef826d0d092e27493203be51 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2672 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2673 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: Running task 2688 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: Running task 2689 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot unihash changed to 71e2234b5937c9bcffea080db935067d577890738f98039944b64eafb40f3772
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4f114cb98cc831f713146dd6ffa7df71dd1b8ba65b5d214325ae8c12290efdda', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 4f114cb98cc831f713146dd6ffa7df71dd1b8ba65b5d214325ae8c12290efdda -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '12ae24055b3e995f79d8654f69d0d69a33954027892e9628f112691a3e3179a6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 12ae24055b3e995f79d8654f69d0d69a33954027892e9628f112691a3e3179a6 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2690 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure_ptest_base)
NOTE: Running task 2691 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: Running task 2692 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 2693 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_packagedata unihash changed to 4e341eee707d1d6f008de5f0001e65a4f37d6feba102b66fe44fc1bf7c1208ce
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0030c4fa5e03b24545d4c344d7f761f17f4290e82e4dfcf3e3ec50d028af055e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 0030c4fa5e03b24545d4c344d7f761f17f4290e82e4dfcf3e3ec50d028af055e -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2694 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_compile)
NOTE: Running task 2699 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 2700 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2701 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2711 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running task 2714 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_deploy_source_date_epoch unihash changed to a69919535a2e7f9cdd057a2cc379d94043f49d39a13cd3522c797850392fe5fe
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '009c1d3aabb54ed6611a22da8283bf58897e6c3dd1638a2f5e43b5cfb316883f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 009c1d3aabb54ed6611a22da8283bf58897e6c3dd1638a2f5e43b5cfb316883f -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0d690821c88c94846a5ad836e4c47fc42e9b0b333f5858f05408ee665a7aae7a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 0d690821c88c94846a5ad836e4c47fc42e9b0b333f5858f05408ee665a7aae7a -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2715 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: Running task 2716 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_write_config)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_write_config: Started
NOTE: Running task 2717 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe xkeyboard-config-2.46-r0: task do_write_config: Succeeded
NOTE: Running task 2718 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Succeeded
NOTE: Running task 2719 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2720 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_compile)
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2723 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2724 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2725 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_configure)
NOTE: recipe xkeyboard-config-2.46-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 39fb8c98e93d0d1b50a76db5f4ac51f9584a9661c965d865e2bc2bc700eb50fc
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '63634f3346fd77fa47f7fdc6b80077a56f6ad405500d5d3ded342d62d913a1a7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 63634f3346fd77fa47f7fdc6b80077a56f6ad405500d5d3ded342d62d913a1a7 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2726 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: Running task 2728 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 2729 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata unihash changed to f841c21996e27fd90e4a859f48dc63cb6bfd861f84399cd182130934109e4d5b
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '94db6b75c9f94fe8cd3e13d20b4596524d587f09c237483e226203f1bf5e3166', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 94db6b75c9f94fe8cd3e13d20b4596524d587f09c237483e226203f1bf5e3166 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2731 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2732 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: Running task 2733 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2734 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 2735 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2736 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: Running task 2737 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package)
NOTE: Running task 2738 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2739 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package: Started
NOTE: Running task 2740 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2741 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_install)
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2742 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2743 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_compile: Started
NOTE: Running task 2745 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_configure)
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package unihash changed to 7cedcdb93d18de879459e1b94ebd958aa9df1cd4809fe652de635abe826eb5e4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a68191b38a6151eca22d357285cef078330c67544f45f919cb0f2ec5b56fc5e5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed a68191b38a6151eca22d357285cef078330c67544f45f919cb0f2ec5b56fc5e5 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2746 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2747 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: Running task 2748 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: recipe libdrm-2.4.131-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: Running task 2749 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2750 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2751 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot unihash changed to a28942f508517383a0cdf41c5ebb19544c48f11470fd4ad670ad14f23d644be6
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot unihash changed to cfe33783d385b5c10aefeacc07c50302da7c5c87a7e932b08f71cc73db213aee
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '169b15f5eadf4cd15aa06064cf0ce1748c4667aeefd8829e9165c0d17733b266', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 169b15f5eadf4cd15aa06064cf0ce1748c4667aeefd8829e9165c0d17733b266 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '893cc10a8227d34e3cd33d87580f06ecc5aca3d3d23edd5349ac87ba8885e90b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 893cc10a8227d34e3cd33d87580f06ecc5aca3d3d23edd5349ac87ba8885e90b -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2752 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2753 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata)
NOTE: Running task 2754 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2755 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package)
NOTE: Running task 2756 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_compile)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2757 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2758 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata unihash changed to c938d2cdadbc99fc54fe5d7e1f911f09b52027c28ca8867e4a488d8bf1f79b1d
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3662acdb8a853519784d83a69f4afc103949e9ed924b4dafbee60200db7c4054', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 3662acdb8a853519784d83a69f4afc103949e9ed924b4dafbee60200db7c4054 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2759 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata)
NOTE: Running task 2760 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2764 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata)
NOTE: Running task 2777 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2778 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_install)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2779 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.46-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2780 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Succeeded
NOTE: Running task 2781 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata unihash changed to d543ae865bbdfed6cfb57a9ab4610a8d5c17443401f69a45e11553a24c654acc
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4df6e1650b5ce4a51512164e3fc7a8c620b02d950b90d618f84c0f889c0225c2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 4df6e1650b5ce4a51512164e3fc7a8c620b02d950b90d618f84c0f889c0225c2 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package unihash changed to c5637b569c80652c49a2d9a2ca181e1babe8fe4b1443eba158fe8eec01e4d076
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata unihash changed to 41d86e5bc9a68af8d460748989ac6fcf4dc4ade13169727aa72698b72ab0d525
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b6f8631c3cf1944a0d42e8cccc2d38f043a7af4decfe9ece2ce9273537258871', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed b6f8631c3cf1944a0d42e8cccc2d38f043a7af4decfe9ece2ce9273537258871 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2782 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: Running task 2783 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2791 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_fetch)
NOTE: Running task 2792 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: recipe libxml2-2.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2793 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: recipe sbc-2.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2794 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_install)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata unihash changed to 40f21f18ee28cc1af42f60d4a5b29e966e924b3010aec6f9f5e9e4957a18d595
NOTE: recipe sbc-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_install: Succeeded
NOTE: Running task 2795 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2796 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_fetch)
NOTE: Running task 2797 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2798 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: Running task 2799 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2805 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 2806 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 2807 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2808 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2809 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2810 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Succeeded
NOTE: Running task 2811 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2812 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_package: Succeeded
NOTE: Running task 2822 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2825 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package unihash changed to efff9298fb49775f183a6a3387f928cf04dfe3b91a7cf191eb2413dcb5e14d12
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b270f8501859279d676976adb0d20857ea09a9630d2f0635aaf3ddfaa8e64cf0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed b270f8501859279d676976adb0d20857ea09a9630d2f0635aaf3ddfaa8e64cf0 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_install_ptest_base: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2826 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata)
NOTE: Running task 2827 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package)
NOTE: Running task 2829 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: Running task 2830 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: Running task 2831 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata unihash changed to 8c76eb29f93a75f34801b6087ee44ef9c0a2c1fba4da465d3fa0bb6244b3c8e2
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '64e903a15ea75eb714bb24aad94ae679f4a77c2bc93d7ad4f1fc03a09e7adf28', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 64e903a15ea75eb714bb24aad94ae679f4a77c2bc93d7ad4f1fc03a09e7adf28 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot unihash changed to 4e7d36d1243bb5ebc54fdacdc06f001bbc1194b89b401cc9ce0b3b38ee420691
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0b3f8c23ffe2ddcd81c9fae806062dcbe60bbcd61e128274f932e491346106e8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 0b3f8c23ffe2ddcd81c9fae806062dcbe60bbcd61e128274f932e491346106e8 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ce4ec2b4741f30fee8432c0f24fe9a0bbc472676cd7c030cf041a1c396eb56e3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed ce4ec2b4741f30fee8432c0f24fe9a0bbc472676cd7c030cf041a1c396eb56e3 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2832 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_compile)
NOTE: Running task 2833 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2834 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch unihash changed to 7627dcc1f3db72a0159690268162ea5a88313780d574bda28f12b8fde6a2e444
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'fb7d80b6cf20c0cf1de1751302b34ac4db8ffc961f18cbf6767ac94ec6902a59', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed fb7d80b6cf20c0cf1de1751302b34ac4db8ffc961f18cbf6767ac94ec6902a59 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1d1be0c6cd18c529ae9f1d3af89cee5a19acae9e39660f2a223fd376db3486f7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 1d1be0c6cd18c529ae9f1d3af89cee5a19acae9e39660f2a223fd376db3486f7 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package unihash changed to 5e8ce1ab319939b0a2baa7f3bd3fba28a2b2736a52e08583de9d27330627be64
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'afbe574d90baf9e2a6d061b158cb4cae0a06fdd4c5c366cea9a67f8e15977b0c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed afbe574d90baf9e2a6d061b158cb4cae0a06fdd4c5c366cea9a67f8e15977b0c -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2835 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: Running task 2836 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2842 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: Running task 2843 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata unihash changed to 046dd2dea56e355979eb158c5a460b048a68a722ab8a383ecf9a1e26aa47385e
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '158c603e2eef982211b5079fe89ee64ab3aa76e8ca79b68cd054304ffefa21d7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 158c603e2eef982211b5079fe89ee64ab3aa76e8ca79b68cd054304ffefa21d7 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2844 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2845 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata)
NOTE: Running task 2846 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: Running task 2847 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2848 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Running task 2858 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_unpack)
NOTE: Running task 2859 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2860 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_install)
NOTE: recipe sbc-2.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '433a0acf8bf22ce35d78df5e0aedab7eec6cab47cae10da77347349b990d18e5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 433a0acf8bf22ce35d78df5e0aedab7eec6cab47cae10da77347349b990d18e5 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '90adfa93674514dac0681adea8aeb407c00fa2f7ec14dfc6a7c3b407b50fd8d6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 90adfa93674514dac0681adea8aeb407c00fa2f7ec14dfc6a7c3b407b50fd8d6 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe sbc-2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata unihash changed to 110fbde570cde21f733c3e462bc4a68862928f594ac5bd4c3432db227865ac3c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6b85836d73b509cb1fa0f4cde7cef9de90ee67d0a4c2504924b9250574fd6acd', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 6b85836d73b509cb1fa0f4cde7cef9de90ee67d0a4c2504924b9250574fd6acd -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata unihash changed to 90e35cf25ac8453379076f37ddc1e68fd6a7d21acb12978682a6c5a29342f67b
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a2eef8918d529bc32569bb76329017912148629249c1e86060dd5e8ce25e9182', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed a2eef8918d529bc32569bb76329017912148629249c1e86060dd5e8ce25e9182 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2861 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: Running task 2862 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 2863 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package)
NOTE: Running task 2864 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: Running task 2865 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: Running task 2866 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2867 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2869 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe sbc-2.1-r0: task do_patch: Started
NOTE: recipe sbc-2.1-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: Running task 2871 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2872 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to fcfae92861c540c02e28d9020521f5a0f167eb52c649ab01f2adf514d84d3805
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c52de1db54db41c3e71debfa0c201178b56824f10d81b305f4dde13fc7a95feb', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed c52de1db54db41c3e71debfa0c201178b56824f10d81b305f4dde13fc7a95feb -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2873 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2874 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_compile)
NOTE: Running task 2875 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: Running task 2887 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_fetch)
NOTE: Running task 2888 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_fetch)
NOTE: Running task 2889 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libxml2-2.15.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2890 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Started
NOTE: Running task 2891 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2892 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2905 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2913 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe libxml2-2.15.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: Running task 2917 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: Running task 2918 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2919 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2924 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2925 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '06682e7aa82c52bf576e73d8e33ea081119c7a6d5826ddc102ea77f62c122bb6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 06682e7aa82c52bf576e73d8e33ea081119c7a6d5826ddc102ea77f62c122bb6 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '33f68702b1580e70b9651b706d198883052c1787e1f651860c8eb6e732403628', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 33f68702b1580e70b9651b706d198883052c1787e1f651860c8eb6e732403628 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2926 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Succeeded
NOTE: Running task 2927 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2928 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2929 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 2930 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 2931 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 86c3a62a37c5003cb4b6b81e616ba0d0f8e2b103c0ca7db90c526585ae41f5ff
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure)
NOTE: Running task 2933 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: Running task 2934 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata unihash changed to fe5d57371d68f86b7d4182c5754cf54d3fc042e45e8c86ab06bdcdbcfce6eaa6
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '236120f708d0af1eb2c2a62b4626c35b22f4ea1a063181f8673193931eeed9ec', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 236120f708d0af1eb2c2a62b4626c35b22f4ea1a063181f8673193931eeed9ec -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2935 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2937 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2938 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_deploy_source_date_epoch unihash changed to fb2ab53d7793a2dd75d2667134f572e99bbe50e94a431d21480d0b3064884c31
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '53e8ac0e37ae2cbce7c284bbd1ef6564c104af34322e854111854dff66b4e964', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 53e8ac0e37ae2cbce7c284bbd1ef6564c104af34322e854111854dff66b4e964 -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '850db6c504a94c528d5751a0a0ef62425805f567ecbf67f9229c88156143fe62', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 850db6c504a94c528d5751a0a0ef62425805f567ecbf67f9229c88156143fe62 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch unihash changed to 5894fcc7f99aa1605981d274a1e93f300d967b0be6254d64823a7388159b1a89
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata unihash changed to 240a9312dad6b64b43dfb4afbce89dadf4cdd87ab866752b3bfa1482eabf2874
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c9aa889d856d4a3dbe1bc40d8fe0fb5b2848f79cde7e2d34908e5cf437ea167e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed c9aa889d856d4a3dbe1bc40d8fe0fb5b2848f79cde7e2d34908e5cf437ea167e -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6e691a49b9df37873213b556dccfd228b6e6b15f94e3f17b09a4b4b449f06eb1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 6e691a49b9df37873213b556dccfd228b6e6b15f94e3f17b09a4b4b449f06eb1 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2939 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2940 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: Running task 2941 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2942 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package)
NOTE: Running task 2947 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2948 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2949 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2950 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot unihash changed to 52ce08d8367d78504cd7f8598b619cb73761d6722938263a865e23afa7cf92ca
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2951 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: Running task 2952 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: Running task 2953 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: Running task 2973 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2974 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2975 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2980 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2981 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2982 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_write_config)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2983 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Succeeded
NOTE: Running task 2984 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: Running task 2985 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2987 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2989 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2990 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'bfb1b00376f0dcb0a24cc841e6e9dca16cff56ddfb314e9d30495b995d7ad2b8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed bfb1b00376f0dcb0a24cc841e6e9dca16cff56ddfb314e9d30495b995d7ad2b8 -> 924d52a1b10701f0a5ab55b266363777d52c444e8c0f4bca2d99b39c215daf5a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2992 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: Running task 2997 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: Running task 2998 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_packagedata: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2999 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3000 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata unihash changed to 7c1540a0caf46ef3fdc5c4750341934d911ccbebc71b8b1f23db3ab4f1bc32f8
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3001 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata)
NOTE: Running task 3005 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata unihash changed to e28c4af671497e69627d8111363e1994014e1385a34e66776f47dccece636239
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '69cedc68d12ce02af430c33961ad832b70d25d67274327d890df1f1bae3ba678', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 69cedc68d12ce02af430c33961ad832b70d25d67274327d890df1f1bae3ba678 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3010 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3012 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 3013 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3015 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 3016 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: Running task 3017 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: Running task 3018 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3019 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3020 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3022 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot unihash changed to 79dfb88e22231ac3023d652936596d1cc21922aa12775fa652c314dc173cbad9
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3023 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 3024 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure)
NOTE: Running task 3025 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package unihash changed to f249c29f58305ffe8c8769b8ba864a3c4617b7923aca065e999350e971564a4d
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3026 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_compile)
NOTE: Running task 3027 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3028 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3029 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3030 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3031 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata unihash changed to f4e7db163856ab587f0c57509dfc405a6d2bb0bb5ba93fd56c36e869ec4e8529
NOTE: Setscene tasks completed
NOTE: Running task 3032 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3034 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 807878cc940da567db5a94c33a8dc00e7bd1f98fbb4144082bd23b24e65aa6cf
NOTE: Running task 3035 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3036 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package unihash changed to a7a232325d2a7afccbce046aa4b093c9ea96b1d4fe81df462c99e03b6ce328c1
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3037 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: Running task 3038 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: Running task 3039 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3040 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 3041 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata unihash changed to 0169e7918548ada472b733dacb47122285fb40fc2ec29f8cb9bb0f666d71d161
NOTE: Setscene tasks completed
NOTE: Running task 3044 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3045 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 3046 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3048 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3064 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 3068 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.46-r0: task do_package: Started
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3096 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3097 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: Running task 3098 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe sbc-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_deploy_source_date_epoch unihash changed to d5b69be3ebb8ca5396b5fc03b0f61d3d328005fc164d15e8a9cda402fc49a82b
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3100 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3101 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: Running task 3102 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_configure_ptest_base)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: Running task 3104 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3105 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to ac7756db6836583e070d78f3a78cf018cf33cf1493bb0684abe9f8ed18ee9e86
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3106 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3108 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 3109 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3111 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_configure)
NOTE: Running task 3120 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 187b589db7dbee2bf45409cbd9f9aa8a1a11489566baba5f929f1ae5237fd86d
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot unihash changed to 97857189c58bc8f1fab77e0bb7dc35933440161c910f9b4464f1e41c05c8ec56
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3121 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 3122 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_install)
NOTE: Running task 3123 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3124 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_write_config)
NOTE: Running task 3139 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3140 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_install: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 3141 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3142 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 3143 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_install: Succeeded
NOTE: Running task 3144 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3154 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3155 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3161 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3162 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3163 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe mesa-2_25.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: Running task 3164 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3165 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3167 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot unihash changed to 855794093534d3a47ff8c43def26dfb1a7bd2b02d664361ff8cdf93bca70fa7c
NOTE: recipe mesa-2_25.3.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3168 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3169 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure_ptest_base)
NOTE: Running task 3170 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3171 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_package unihash changed to 9569fe10c3ef50871e9cee08cd72dd65ee4dcf15fb4c71ac85463436227c7b1f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '67db7552e81aa72e13ea814e64253076b43236b9a69a68f8f754233173e53c39', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 67db7552e81aa72e13ea814e64253076b43236b9a69a68f8f754233173e53c39 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3172 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile)
NOTE: Running task 3173 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: Running task 3174 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata)
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3175 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: Running task 3176 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata)
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3188 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3189 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: Running task 3190 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata unihash changed to 6412416f0d7815d3b2a5e6fc7b28c1ef9902b1a4efea34add848e2166d9aae31
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7e9b0e0c8ac59f15eef1f275a0e0296bbf2a9459d468f037415de806e7d246bf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 7e9b0e0c8ac59f15eef1f275a0e0296bbf2a9459d468f037415de806e7d246bf -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3191 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata unihash changed to 2d1646ee4ffcef9793c872fc278fac02683b79463df84dcf975ee2c6f5bdb014
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f948a3e91d7820cc95e6847623a9de1df15be07eba0e0461c2fabf1147f2512a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed f948a3e91d7820cc95e6847623a9de1df15be07eba0e0461c2fabf1147f2512a -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3192 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile_ptest_base)
NOTE: Running task 3193 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: Running task 3196 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3198 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch unihash changed to ae8f9c1d698c02d14600200efe944d143ed62bf5c6201151f57426fe04ed2278
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch unihash changed to 542dc977ec38616f99b5b91e99709c7cfc53138c4f578c116b0c0b5c56769977
NOTE: recipe libusb1-1.0.29-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3199 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3200 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3201 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_compile)
NOTE: recipe libxml2-2.15.1-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch unihash changed to d44c47012b255c3b02087677681a46dfbf096ee93097a58ca8622d4e063820ec
NOTE: Running task 3202 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata)
NOTE: Running task 3203 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install_ptest_base)
NOTE: Running task 3204 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_unpack)
NOTE: Running task 3207 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_write_config)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Started
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3208 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3209 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package unihash changed to 7f18959fd692f78ae88e5c482ba2f4ffae89720dc6a8fe69d10ca4be4e9c38a8
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile_ptest_base: Started
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3210 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: Running task 3211 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_install)
NOTE: Running task 3212 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3213 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install: Started
NOTE: Running task 3214 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3215 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3216 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata unihash changed to aa6d232488f4ef68b56dd0b68d4f6266b29620d23dec6ab0042543d89d9878c1
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3217 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3218 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: Running task 3219 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3220 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3221 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3222 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata unihash changed to b493605be1f4dd8f4a1cebe70c6276f361b9edb843252a55575d43d914e848ec
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '8ac8ca5b1a4647ed404c846a94f0e680f705bd3b3a66bf273628a10f8f6efc0a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 8ac8ca5b1a4647ed404c846a94f0e680f705bd3b3a66bf273628a10f8f6efc0a -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to 99513540609c070e298067f3455e71760fe41339881eea4051c389a59313a4e2
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '55fa44a172c8fd1a1e0f96db748d28c41f23cd5c86d1842932c01415c7f34bef', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 55fa44a172c8fd1a1e0f96db748d28c41f23cd5c86d1842932c01415c7f34bef -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3227 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_configure)
NOTE: Running task 3228 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 3237 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3238 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe tiff-4.7.1-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3239 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: Running task 3240 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch unihash changed to 9f281ae700dd469b716e59a81d556f783b322f5e26b0182948194491eff91d5f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1780643c070e665fdfeda0f3abd155d6c7e7be93d309a9fe83f54b2a2eca376f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 1780643c070e665fdfeda0f3abd155d6c7e7be93d309a9fe83f54b2a2eca376f -> 3993589bb459e19c7ae2f0ba1059d5e9ca2176b73d1b179723c0ff67807ced62 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'cedf934207a001d9b6f6d46188e563ef9f8ad1ca0d4b2f9a8ba20dd0dd699143', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed cedf934207a001d9b6f6d46188e563ef9f8ad1ca0d4b2f9a8ba20dd0dd699143 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3242 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install: Succeeded
NOTE: Running task 3243 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_install_ptest_base)
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Succeeded
NOTE: Running task 3253 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install_ptest_base: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata unihash changed to af0c50e0ac6c2fbd15ae107074b1d54fccfa9a18f748d53960549c82ed69f327
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3254 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot)
NOTE: Running task 3255 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install_ptest_base)
NOTE: Running task 3256 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3295 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3296 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3297 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3298 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: Running task 3299 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: Running task 3300 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3301 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_package)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3303 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3304 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata unihash changed to 63016b0de5cbca1bb4ef28c7121bb97a26fc5840eff0dfb3d9c4e5e6b7328f5f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1c0d15a5d0eb6047a7feabbbca24d36cb229cfc810905bda20d796dd5e10846b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 1c0d15a5d0eb6047a7feabbbca24d36cb229cfc810905bda20d796dd5e10846b -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3305 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3306 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: Running task 3307 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: Running task 3311 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_package: Started
NOTE: Running task 3323 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3324 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 3327 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3328 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Succeeded
NOTE: Running task 3329 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_package)
NOTE: Running task 3330 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_install)
NOTE: recipe libusb1-1.0.29-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3331 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_package: Succeeded
NOTE: Running task 3332 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: Running task 3333 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package unihash changed to c10e3b67455cf5d258a38ce1c0d2a86d07536375399d1a85b0815d52ec6e851f
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 3335 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Started
NOTE: recipe icu-78.1-r0: task do_compile: Succeeded
NOTE: Running task 3336 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_packagedata unihash changed to 9c01a06e4f57ec8a94016f19d1d3a66766f16a32b5063a9376354a07b2fc5cf0
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '37d6cef45538cac4da771a8a881145f71c8f2216c0c7768aef15a88efdae3f86', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 37d6cef45538cac4da771a8a881145f71c8f2216c0c7768aef15a88efdae3f86 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe icu-78.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata unihash changed to 2b9b6aa6b8ab0fe009de1ca8d3cc5f857d792fee48060764398788aec6f858c4
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata unihash changed to 96be2c7ece894c5b20161bf8189686f11d5b1aefca0f79ea2b441273bdc0e778
NOTE: Setscene tasks completed
NOTE: Running task 3337 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: Running task 3338 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_populate_sysroot)
NOTE: Running task 3339 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_package)
NOTE: Running task 3361 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 3362 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3396 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Started
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3397 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata unihash changed to 18d17bcde69219c4073d67ac93345a4ade45a227bc8d6462d218d0508aa7b7c9
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '488a46e44caccbcf7ce371a3ea9e3852f0c49bd9f6c4d44178228ee6ed33c6b5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 488a46e44caccbcf7ce371a3ea9e3852f0c49bd9f6c4d44178228ee6ed33c6b5 -> 1dd31c9e29d9c1b61b071229a5e968e6b9032c163f403c1fd9f2edbec5cd22e5 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch unihash changed to 7b94c73379dda396cb166024bfb60c1e4cb90e1aff2ef555469e29f201796ed5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 163e928cdeea6848621bb8f3bb8c08e1de4d2d3ed2492c5f9808372bf6871652
NOTE: Setscene tasks completed
NOTE: Running task 3409 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3410 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 3414 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_collect_spdx_deps)
NOTE: Running task 3417 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3423 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3424 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe icu-78.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3425 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe icu-78.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3426 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: Running task 3436 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Started
NOTE: Running task 3455 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_write_config)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3456 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_create_spdx)
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 3460 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 3461 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3462 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3470 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_collect_spdx_deps)
NOTE: Running task 3471 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3472 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: Running task 3473 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.131-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 3480 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.131-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3481 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: Running task 3482 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 3483 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: Running task 3487 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 3495 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata unihash changed to 3e7448b65b13391c2ba653e8d4a8edd336bd5787e0775ee9cde22a618a41d9c1
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3496 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx: Succeeded
NOTE: Running task 3499 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 3501 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 3504 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: Running task 3509 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: Running task 3510 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to eeaa6f6c906e01bd21eb16e59cd57324853c023fad6194e034fecc149ae8c700
NOTE: Setscene tasks completed
NOTE: Running task 3511 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3512 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: Running task 3513 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3515 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: Setscene tasks completed
NOTE: Running task 3516 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3522 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3523 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3524 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: Running task 3525 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_unpack)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3526 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to 3f14bbc7987249eee3d9ad5e087dcc777f9b63ed091dbcbbdd33baa3c72c3a02
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 3527 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 3528 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: Running task 3533 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_patch)
NOTE: Running task 3544 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3545 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Succeeded
NOTE: Running task 3546 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3557 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3558 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: Running task 3559 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3560 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3561 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch unihash changed to 266664f31e63b63b46728403871a5ad81bb9406412961076fbf36a674a24059c
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3562 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3563 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: Setscene tasks completed
NOTE: Running task 3564 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 3565 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_collect_spdx_deps)
NOTE: Running task 3566 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3567 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3568 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3569 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3570 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3571 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3574 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3575 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 51778725f194616169f7bd986fe6a210102aab443a45fbba5c1fe4f7017cc1bc
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3597 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3598 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3599 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3602 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 3609 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3610 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_create_spdx)
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3611 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.46-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3612 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Started
NOTE: Running task 3613 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3618 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx)
NOTE: Running task 3619 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3620 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3626 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3627 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 3628 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3629 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.46-r0: task do_create_spdx: Succeeded
NOTE: Running task 3630 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 3631 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3632 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_deploy_source_date_epoch unihash changed to 657d99be0232d0ef046be7a087a4317b49245a5a401378245cb94c6647bde0b1
NOTE: Setscene tasks completed
NOTE: Running task 3633 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3634 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3635 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Started
NOTE: Running task 3665 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: Setscene tasks completed
NOTE: Running task 3666 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3667 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_configure)
NOTE: Running task 3668 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3669 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3670 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3671 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3672 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: Running task 3673 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: Running task 3674 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3675 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: Running task 3676 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3677 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3691 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata unihash changed to 0f15a52a0a6cef139aea0c9aa0d517d673c4cf7b4b204f917f2cff6a3f2c0eed
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot unihash changed to 6f5f904612b5fc2408bde31b60b3db1f4b0aa9166231fba76fffa148b627711e
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 3692 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata)
NOTE: Running task 3693 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_collect_spdx_deps)
NOTE: Running task 3695 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3697 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata: Started
NOTE: recipe readline-8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3698 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx)
NOTE: recipe readline-8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3700 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3701 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_collect_spdx_deps)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 3703 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3704 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata unihash changed to b0835fe642bd745511c767f8115024f193324c32b1688ce78bc9e01c51d64769
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3705 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3706 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3708 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: Running task 3709 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx)
NOTE: Running task 3710 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 3711 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3712 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 6ebf86e9fa8ebc11372dbdcfa9f41a1776ef59aa5b4ed5c89dc669534fb24a1e
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 3725 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 3741 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Succeeded
NOTE: Running task 3742 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3743 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Succeeded
NOTE: Running task 3744 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: Running task 3745 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_install)
NOTE: Running task 3746 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3747 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3748 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3749 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3754 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Succeeded
NOTE: Running task 3755 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_package)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic unihash changed to 491cb3088b2b5e733ec0272edb69954776d4eccc2a3eaaaf9ba2826ffe8c75ec
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3757 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package unihash changed to fb3e402d0c996fd85181952570255a6d7ce742eb34c28314a4ca6879bfc034d3
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3758 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: Running task 3759 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: Running task 3760 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3761 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata unihash changed to 603954c726d17eb850996334038ee811b3faa8753d122a71a804282faeb553c0
NOTE: Running task 3762 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe sbc-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3763 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to 197ae3d0942d7f23cb0c4cebf56614f9bf5acc01744543f5b6917b713074b5b6
NOTE: Setscene tasks completed
NOTE: Running task 3764 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe sbc-2.1-r0: task do_configure: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3765 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa unihash changed to 996db5236af6f9180ac3652894ae73822b5ce9842266e4e61529b0b5bfa4deba
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Succeeded
NOTE: Running task 3766 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 17b290acaac0b59eb0001bda1cf3182ef7985470be2375742020f7e0ea8f0d02
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to cbdfd793856b25035591e37cd1f6572fc57569f56cfab9a9d55f22849ca45229
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3768 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3769 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: Running task 3770 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package: Succeeded
NOTE: Running task 3771 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata: Started
NOTE: recipe tiff-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 3772 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to f78ca19c3022f4dc00de613783b271d5617180c6b44d92d4be125330c8f861f9
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_install: Started
NOTE: Running task 3773 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3774 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3775 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_create_spdx)
NOTE: recipe sbc-2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3776 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 9412219b4603b3e7ec4dc2e49db1352219567bb1e39dcd91667453ccfcf923e2
NOTE: Setscene tasks completed
NOTE: Running task 3777 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk)
NOTE: Running task 3778 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb)
NOTE: Running task 3779 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm)
NOTE: Running task 3780 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Started
NOTE: recipe sbc-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3781 of 3932 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_compile)
NOTE: recipe sbc-2.1-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_install: Succeeded
NOTE: recipe sbc-2.1-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe icu-78.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe mesa-2_25.3.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3781 tasks of which 3057 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201110406.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201110406.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-dbusmock/0.37.2/temp/log.do_packagedata.487196
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-src went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-dbg went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-staticdev went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-dev went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-doc went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock-locale went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: QA Issue: Package version for package python3-dbusmock went backwards which would break package feeds (from 0:0.38.1-r0 to 0:0.37.2-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-dbusmock/0.37.2/temp/log.do_packagedata.487196
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata) failed with exit code '1'

--===============6186019831583817619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2000.2", added "/usr/lib/.debug/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 73372512 to 73409176 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23794509 to 23802810 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 121534 to 122638 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGSIZE changed from 113168 to 115169 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 122561 to 122565 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGSIZE changed from 115522 to 121144 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 141246 to 148230 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.20.2/testsuite/reftests -> /usr/src/debug/gtk4/4.20.3/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/roaring -> /usr/src/debug/gtk4/4.20.3/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/deprecated -> /usr/src/debug/gtk4/4.20.3/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/deprecated -> /usr/src/debug/gtk4/4.20.3/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/x11 -> /usr/src/debug/gtk4/4.20.3/gdk/x11, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/css -> /usr/src/debug/gtk4/4.20.3/gtk/css, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/media -> /usr/src/debug/gtk4/4.20.3/gtk/media, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print -> /usr/src/debug/gtk4/4.20.3/gtk/print, directory renamed /usr/src/debug/gtk4/4.20.2/gtk -> /usr/src/debug/gtk4/4.20.3/gtk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print/ba
 ckends -> /usr/src/debug/gtk4/4.20.3/gtk/print/backends, directory renamed /usr/src/debug/gtk4/4.20.2/tools -> /usr/src/debug/gtk4/4.20.3/tools, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.20.3/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/wayland -> /usr/src/debug/gtk4/4.20.3/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.20.2/gdk -> /usr/src/debug/gtk4/4.20.3/gdk, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gl -> /usr/src/debug/gtk4/4.20.3/gsk/gl, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y -> /usr/src/debug/gtk4/4.20.3/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/loaders -> /usr/src/debug/gtk4/4.20.3/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/timsort -> /usr/src/debug/gtk4/4.20.3/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu -> /usr/src/debug/gtk4/4.20.3/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.20.2/gsk -> /usr/src/debug/gtk4/4.20.3/gsk, 
 directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.20.3/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/inspector -> /usr/src/debug/gtk4/4.20.3/gtk/inspector
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 48648202 to 48660513 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 18779030 to 18833598 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.2.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.3.tar.xz;name=archive"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============6186019831583817619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.2-4.20.3.patch"

RnJvbSBhMGY3NGI1OTZmNWE0OGEwODczYzA2MmQ3YTk2ZjEzMzRmZGQ5MmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMTowNTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4yMC4yIC0+IDQuMjAuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjIwLjIuYmIgPT4gZ3RrNF80LjIwLjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4yMC4yLmJiID0+IGd0azRfNC4yMC4zLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCmluZGV4IDkyNzkxZGIxNjkuLmVm
OWEwNWY3ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCkBAIC0zMyw3
ICszMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiIFwKICAgICBmaWxlOi8vdGVzdHMvdGVzdGd0
ay5jO2VuZGxpbmU9MjU7bWQ1PTQ5ZDA2NzcwNjgxYjgzMjI0NjZiNTJlZDE5ZDI5ZmIyIFwKICIK
IAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNWU4MjQwZWRlY2FmYWZmMmI4YmFmNDY2
M2JkY2VhYTY2OGVmMTBhMjA3YmVlNGQ3ZjkwZTAxMGUxMGJkZGM1YyIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjI4NzNmMjkwMzA4OGE2NmM3MTE3M2VhMmVkODVmZmFlMjY2YTY2Yjk3
MmMzYTQ4NDJiYmIyZjZmMTg3ZWMxNTMiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0t
JHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============6186019831583817619==--

