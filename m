Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.13300.1626600381830576649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 54AB438C1288
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.21.0 FAILED
Message-ID: <MADEUP.1692D86DE90DF11B.32641@lists.openembedded.org>
X-Groupsio-MsgNum: 153956
Content-Type: multipart/mixed; boundary="===============9059735424380116858=="

--===============9059735424380116858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.21.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.20.5-3.21.0.patch
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

--===============9059735424380116858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb: Unable to get checksum for cmake-native SRC_URI entry environment.d-cmake.sh: file could not be found
done.
Parsing of 821 .bb files complete (819 cached, 2 parsed). 1458 targets, 34 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a1b2991092ac0f434fb76896efc0ab0503717824"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1b2991092ac0f434fb76896efc0ab0503717824"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 304 Local 232 Network 0 Missed 72 Current 454 (76% match, 90% complete)
Removing 15 stale sstate objects for arch qemux86...done.
Removing 6 stale sstate objects for arch x86_64...done.
Removing 19 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_setscene)
NOTE: Running setscene task 500 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_setscene)
NOTE: Running setscene task 510 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 670 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: Running task 555 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_fetch)
NOTE: Running task 561 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 747 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 762 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_write_config)
NOTE: recipe elfutils-0.185-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_fetch: Started
NOTE: Running task 794 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_fetch)
NOTE: Running task 796 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_fetch)
NOTE: Running task 798 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: Running task 801 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.20.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 832 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 854 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 883 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_write_config)
NOTE: Running task 886 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_warn_musl)
NOTE: Running task 887 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_write_config)
NOTE: Running task 910 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_write_config)
NOTE: recipe elfutils-0.185-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: Running task 952 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: Running task 955 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_fetch)
WARNING: cmake-native-3.20.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz_bad-checksum_12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_unpack)
NOTE: recipe expat-2.4.1-r0: task do_unpack: Started
NOTE: Running task 1022 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running setscene task 695 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1066 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_unpack)
NOTE: Running task 1070 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_fetch)
NOTE: Running task 1076 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.21.0.bb:do_fetch)
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_write_config: Started
NOTE: Running setscene task 697 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37-r0: task do_package_setscene: Started
NOTE: Running setscene task 701 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_fetch: Started
NOTE: Running setscene task 703 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-0.21-r0: task do_fetch: Started
NOTE: recipe systemd-1_248.3-r0: task do_fetch: Started
NOTE: Running task 1110 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: Running task 1120 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_fetch)
NOTE: Running task 1128 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1129 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_write_config: Started
NOTE: Running task 1135 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_write_config: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: recipe gettext-0.21-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 706 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1156 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_write_config: Started
NOTE: Running task 1157 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_unpack)
NOTE: Running task 1158 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_unpack)
NOTE: Running task 1159 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_unpack)
NOTE: Running task 1188 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: recipe systemd-1_248.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_248.3-r0: task do_warn_musl: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_write_config: Succeeded
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.21.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe bison-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1264 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_unpack)
NOTE: recipe systemd-1_248.3-r0: task do_write_config: Succeeded
NOTE: recipe cmake-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1280 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1281 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.21.0.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running task 1356 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe bison-3.7.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-3.21.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: Running task 1394 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1395 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_unpack)
NOTE: recipe gettext-0.21-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 712 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1396 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: Running setscene task 713 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 714 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d210067d7f8f8c7faafe292728615f7f7822ac12fe128e4b506afbf2b2f4b501
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running setscene task 717 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_unpack: Started
NOTE: Running task 1407 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_patch)
NOTE: Running task 1408 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_patch)
NOTE: Running task 1409 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1410 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1411 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1412 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_generate_toolchain_file)
NOTE: Running task 1414 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.1+gitAUTOINC+5822e50c29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1431 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1441 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe expat-2.4.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: Running setscene task 722 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1451 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: Running setscene task 724 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1+gitAUTOINC+5822e50c29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 1453 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe bison-3.7.6-r0: task do_patch: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1+gitAUTOINC+5822e50c29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_unpack: Succeeded
NOTE: Running task 1488 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_patch)
NOTE: recipe bison-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.1+gitAUTOINC+5822e50c29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 734 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_patch: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: cmake-native-3.20.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz_bad-checksum_12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0
WARNING: cmake-native-3.20.5-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.20/cmake-3.20.5.tar.gz - will attempt other sources if available
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 738 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_unpack: Succeeded
NOTE: Running task 1508 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_patch)
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_patch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: cmake-native-3.20.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz_bad-checksum_12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0
ERROR: cmake-native-3.20.5-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.20/cmake-3.20.5.tar.gz
ERROR: cmake-native-3.20.5-r0 do_fetch: Fetcher failure for URL: 'https://cmake.org/files/v3.20/cmake-3.20.5.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.5.tar.gz' has sha256 checksum '12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0' when '4a42d56449a51f4d3809ab4d3b61fd4a96a469e56266e896ce1009b5768bd2ab' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.20.5-r0/temp/log.do_fetch.2889095
NOTE: recipe cmake-native-3.20.5-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb:do_fetch) failed with exit code '1'
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_patch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1512 tasks of which 1457 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb:do_fetch
Summary: There were 9 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============9059735424380116858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.20.5-3.21.0.patch"

From 28d64d60ce9206d499168bef9c89f9dcee8d84a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 07:13:39 +0000
Subject: [PATCH] cmake: upgrade 3.20.5 -> 3.21.0

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...stem-use-oe-environment-vars-to-load.patch |  6 ++---
 .../cmake/cmake/OEToolchainConfig.cmake       | 25 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 --
 .../{cmake_3.20.5.bb => cmake_3.21.0.bb}      | 10 ++++----
 5 files changed, 9 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.20.5.bb => cmake_3.21.0.bb} (81%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index c557a55527..358f284279 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0"
+SRC_URI[sha256sum] = "4a42d56449a51f4d3809ab4d3b61fd4a96a469e56266e896ce1009b5768bd2ab"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9609f5f7c2..e521232252 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From e75f76b00cc9c1cfc231c5e731e975552f5dd13e Mon Sep 17 00:00:00 2001
+From 667528d4c594b57700a5f629d41e787921c9fc53 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,10 +25,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index bae270de..5bb6bc0d 100644
+index 8c7af06..ade2b18 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
-@@ -111,6 +111,13 @@ else()
+@@ -112,6 +112,13 @@ else()
    endif()
  endif()
  
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
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.5.bb b/meta/recipes-devtools/cmake/cmake_3.21.0.bb
similarity index 81%
rename from meta/recipes-devtools/cmake/cmake_3.20.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.0.bb
index 64c92b89f2..0ac81cad89 100644
--- a/meta/recipes-devtools/cmake/cmake_3.20.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.21.0.bb
@@ -4,11 +4,11 @@ inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI_append_class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+           "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.27.0


--===============9059735424380116858==--
