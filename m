Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12220.1602843683020080320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 44B4538C174E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.18.4 FAILED
Message-ID: <MADEUP.163E71D67C0E0DA3.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143421
Content-Type: multipart/mixed; boundary="===============4161168633705644650=="

--===============4161168633705644650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.18.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.18.2-3.18.4.patch
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

--===============4161168633705644650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1387 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb: Unable to get checksum for cmake-native SRC_URI entry environment.d-cmake.sh: file could not be found
done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:df68c19ba99e9865712395927d9a662e171f2994"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 286 Found 214 Missed 72 Current 463 (74% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 479 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_setscene)
NOTE: Running setscene task 551 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 689 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 719 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 721 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 729 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 635 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_fetch)
NOTE: Running task 637 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 745 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: Running task 748 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 800 of 2332 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_fetch)
NOTE: recipe expat-2.2.9-r0: task do_fetch: Started
NOTE: Running task 807 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: recipe cmake-native-3.18.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_unpack)
NOTE: Running task 885 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_write_config)
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: Running task 920 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 959 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
WARNING: cmake-native-3.18.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.18.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz_bad-checksum_5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_unpack)
NOTE: Running task 1038 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1039 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_fetch)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.2.9-r0: task do_fetch: Started
NOTE: Running task 1053 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_unpack)
NOTE: recipe expat-2.2.9-r0: task do_unpack: Started
NOTE: recipe expat-native-2.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1087 of 2332 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_write_config: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: Running task 1116 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 1125 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1245 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_write_config)
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_fetch: Started
NOTE: Running task 1276 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1304 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running setscene task 733 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_unpack: Started
NOTE: Running task 1307 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_fetch)
NOTE: Running task 1311 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: Running task 1319 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.18.4.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.2.9-r0: task do_unpack: Started
NOTE: Running task 1342 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_unpack)
NOTE: Running task 1343 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1384 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1417 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-3.18.4-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_patch: Started
NOTE: recipe cmake-3.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 1461 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.18.4.bb:do_unpack)
NOTE: recipe expat-native-2.2.9-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: Running task 1470 of 2332 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_patch)
NOTE: Running task 1471 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_unpack)
NOTE: Running task 1472 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 1473 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_fetch)
NOTE: Running task 1474 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 1476 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1484 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_fetch)
NOTE: Running task 1489 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_write_config)
NOTE: recipe mesa-2_20.1.8-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1500 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_write_config)
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 1576 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_unpack)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1613 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_patch)
NOTE: Running task 1614 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe cmake-3.18.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_unpack: Started
NOTE: Running task 1662 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_fetch: Started
NOTE: Running task 1670 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1689 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_write_config)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 736 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_write_config: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: Running task 1691 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_unpack)
NOTE: Running task 1692 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1698 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: recipe expat-native-2.2.9-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_write_config: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_patch: Started
NOTE: Running task 1760 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_write_config: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1868 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.2.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 1870 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe btrfs-tools-5.7-r0: task do_unpack: Started
NOTE: Running task 1871 of 2332 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_generate_toolchain_file)
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe expat-2.2.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_patch)
NOTE: recipe eudev-3.2.9-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 743 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.2.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 747 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1887 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.2.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: Running task 1907 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1930 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: cmake-native-3.18.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.18.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz_bad-checksum_5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e
WARNING: cmake-native-3.18.2-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.18/cmake-3.18.2.tar.gz - will attempt other sources if available
NOTE: recipe btrfs-tools-5.7-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_patch: Succeeded
WARNING: cmake-native-3.18.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.18.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz_bad-checksum_5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e
ERROR: cmake-native-3.18.2-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.18/cmake-3.18.2.tar.gz
ERROR: cmake-native-3.18.2-r0 do_fetch: Fetcher failure for URL: 'https://cmake.org/files/v3.18/cmake-3.18.2.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.18.2.tar.gz' has sha256 checksum 5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e when 597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.18.2-r0/temp/log.do_fetch.1615035
NOTE: recipe cmake-native-3.18.2-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb:do_fetch) failed with exit code '1'
NOTE: recipe mesa-2_20.1.8-r0: task do_unpack: Succeeded
NOTE: recipe cmake-3.18.4-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2160 tasks of which 2099 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb:do_fetch
Summary: There were 9 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4161168633705644650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.18.2-3.18.4.patch"

From 2974f1c837d8cfb030db65917ef76c2d7a3b55d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:18:49 +0000
Subject: [PATCH] cmake: upgrade 3.18.2 -> 3.18.4

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...stem-use-oe-environment-vars-to-load.patch |  2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       | 25 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 --
 .../{cmake_3.18.2.bb => cmake_3.18.4.bb}      | 11 ++++----
 5 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.18.2.bb => cmake_3.18.4.bb} (78%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fa1b818ae4..e840e884cf 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
+SRC_URI[sha256sum] = "597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index c4f81b27b5..66e5286ffb 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From dd0fe8d54def4684d360b3e9b10e963ef0208202 Mon Sep 17 00:00:00 2001
+From e9478d8f22ceecfe20384db184fafe6e80ef3690 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
deleted file mode 100644
index 8f6f3a272d..0000000000
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ /dev/null
@@ -1,25 +0,0 @@
-set( CMAKE_SYSTEM_NAME Linux )
-set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
-set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
-
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-
-set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
-
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
-
-# Include the toolchain configuration subscripts
-file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
-foreach(config ${toolchain_config_files})
-    include(${config})
-endforeach()
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
deleted file mode 100644
index 7bdb19fb6c..0000000000
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
-export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
diff --git a/meta/recipes-devtools/cmake/cmake_3.18.2.bb b/meta/recipes-devtools/cmake/cmake_3.18.4.bb
similarity index 78%
rename from meta/recipes-devtools/cmake/cmake_3.18.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.18.4.bb
index 64c92b89f2..8cf4c617ac 100644
--- a/meta/recipes-devtools/cmake/cmake_3.18.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.18.4.bb
@@ -4,11 +4,12 @@ inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI_append_class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
+           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+           "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.18.4


--===============4161168633705644650==--
