Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5931.1624805202637788586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 17FF838C1323
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.16.0 SUCCEEDED
Message-ID: <MADEUP.168C77B93B4257AD.17375@lists.openembedded.org>
X-Groupsio-MsgNum: 153315
Content-Type: multipart/mixed; boundary="===============0004159851504514505=="

--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-1.15.1-1.16.0.patch
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

--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ae5411359aac4fdd5de9aa844876fed7909beef9"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae5411359aac4fdd5de9aa844876fed7909beef9"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 102 Network 0 Missed 16 Current 647 (86% match, 97% complete)
Removing 8 stale sstate objects for arch qemumips...done.
Removing 28 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 649 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 650 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 652 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 653 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 672 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 673 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 674 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 680 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 681 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 682 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 695 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 700 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1441 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running task 1499 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 701 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1765 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1766 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1859 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_unpack)
NOTE: Running setscene task 702 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 703 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 704 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 706 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 709 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1979 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1996 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1997 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 721 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2063 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic unihash changed to 22cc849fe59840e7342a38250981dec4bb62c859745378fb73811f4e78ee8e1f
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2153 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2191 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 841825cfc653d46a4b24e061c26555a5a0ddc6388490cee7a6ee60ef81e77c87
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b78b5efb05abe13a8acf5c0eb54a13e47fc93ebb9c7c23ee3f2dc7022fb6c093
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-staticdev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-doc went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-bin went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-da went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-de went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-eo went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-es went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ja went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pl went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pt-br went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ru went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sv went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-uk went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-vi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: Running task 2410 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2411 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_configure)
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_compile)
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_install)
NOTE: recipe gpgme-1.16.0-r0: task do_install: Started
NOTE: recipe gpgme-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package)
NOTE: Running task 2418 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_packagedata)
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_write_rpm)
NOTE: Running task 2421 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_qa)
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2422 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2422 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============0004159851504514505==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-1.15.1-1.16.0.patch"

From 9674ba8a0dd03aa843a4da27b9073cf129fe0e34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 14:46:41 +0000
Subject: [PATCH] gpgme: upgrade 1.15.1 -> 1.16.0

---
 meta/recipes-support/gpgme/{gpgme_1.15.1.bb => gpgme_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.15.1.bb => gpgme_1.16.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.15.1.bb b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.15.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.16.0.bb
index dc38aa8e3c..da413c80a0 100644
--- a/meta/recipes-support/gpgme/gpgme_1.15.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[sha256sum] = "eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad"
+SRC_URI[sha256sum] = "6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.17.1


--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-doc: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-locale: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
Changes to packages/core2-32-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.12.1 to libgpgmepp.so.6.13.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.12.1 to libgpgmepp.so.6.13.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.24.1 to libgpgme.so.11.25.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.24.1 to libgpgme.so.11.25.0
  /usr/lib/libgpgmepp.so.6.12.1 moved to /usr/lib/libgpgmepp.so.6.13.0
  /usr/lib/libgpgme.so.11.24.1 moved to /usr/lib/libgpgme.so.11.25.0
  /usr/lib/python3.9/site-packages/gpg-1.15.1_unknown-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gpg-1.16.0_unknown-py3.9.egg-info

--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ae5411359aac4fdd5de9aa844876fed7909beef9"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae5411359aac4fdd5de9aa844876fed7909beef9"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 98 Network 0 Missed 16 Current 651 (85% match, 97% complete)
Removing 7 stale sstate objects for arch qemuarm...done.
Removing 27 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 657 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 668 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 673 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 674 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 678 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 682 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 683 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 684 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 699 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1441 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1500 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_fetch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1819 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1895 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_unpack)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1966 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 702 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 703 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 704 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_patch)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 706 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1972 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 708 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2050 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 714 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2063 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic)
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic unihash changed to 22cc849fe59840e7342a38250981dec4bb62c859745378fb73811f4e78ee8e1f
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2153 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2191 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2192 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b206359c4ac281199fb6df57609777e2913cb5d2d36821e97aa72a53628a6f43
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 660310fae8a1a52d1e7a820ecf75e948b1dd6e0c3c2b79e4331d33c58a528489
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-staticdev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-doc went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-bin went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-da went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-de went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-eo went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-es went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ja went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pl went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pt-br went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ru went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sv went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-uk went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-vi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2408 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: Running task 2410 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2411 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_configure)
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_compile)
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_install)
NOTE: recipe gpgme-1.16.0-r0: task do_install: Started
NOTE: recipe gpgme-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package)
NOTE: Running task 2418 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_packagedata)
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_write_rpm)
NOTE: Running task 2421 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_qa)
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2422 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2422 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ae5411359aac4fdd5de9aa844876fed7909beef9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae5411359aac4fdd5de9aa844876fed7909beef9"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 116 Local 100 Network 0 Missed 16 Current 649 (86% match, 97% complete)
Removing 8 stale sstate objects for arch qemux86_64...done.
Removing 28 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 651 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 652 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 653 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 668 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 673 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 674 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 678 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 681 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 682 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 683 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 684 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 698 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 700 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 701 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1441 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1499 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_fetch)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 702 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 703 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 704 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 706 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1959 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 1960 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 707 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running task 1961 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 708 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1974 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 713 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 2052 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 2053 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2058 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2068 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic)
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Started
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_lic unihash changed to 22cc849fe59840e7342a38250981dec4bb62c859745378fb73811f4e78ee8e1f
NOTE: recipe gpgme-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2153 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2191 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c26e00ca8ecd41900a5ec56f0e8feffbd4e276f028a9db6fcef41dcb579dede2
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 09c5a062478d866374a9bc75cff21db5e16fb9d07761b5edccd9a2dd3fc8de0f
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-staticdev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-doc went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-bin went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-da went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-de went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-eo went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-es went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ja went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pl went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pt-br went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ru went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sv went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-uk went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-vi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2408 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: Running task 2410 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2411 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_configure)
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_compile)
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_install)
NOTE: recipe gpgme-1.16.0-r0: task do_install: Started
NOTE: recipe gpgme-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package)
NOTE: Running task 2418 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_populate_sysroot)
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package: Started
NOTE: recipe gpgme-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_packagedata)
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_write_rpm)
NOTE: Running task 2421 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_package_qa)
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Started
NOTE: recipe gpgme-1.16.0-r0: task do_package_qa: Succeeded
NOTE: recipe gpgme-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2422 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.16.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2422 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============0004159851504514505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gpgme/gpgme-cpp: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-cpp: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 8829004 to 8883780 (+1%)
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 245395 to 246325 (+0%)
packages/core2-32-poky-linux/gpgme/gpgme-dev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-doc: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 461770 to 463562 (+0%)
packages/core2-32-poky-linux/gpgme/gpgme-doc: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-doc: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-locale: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-locale: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-locale: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-src: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 3473246 to 3490151 (+0%)
packages/core2-32-poky-linux/gpgme/gpgme-src: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-src: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme/gpgme: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme: PKGSIZE changed from 556223 to 556227 (+0%)
packages/core2-32-poky-linux/gpgme/gpgme: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
packages/core2-32-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.15.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0007-python-Add-variables-to-tests.patch file://0008-do-not-auto-check-var-PYTHON.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.16.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.
 patch file://0007-python-Add-variables-to-tests.patch file://0008-do-not-auto-check-var-PYTHON.patch"
packages/core2-32-poky-linux/gpgme: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/python3-gpg: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/gpgme/python3-gpg: PKGSIZE changed from 1375428 to 1377020 (+0%)
packages/core2-32-poky-linux/gpgme/python3-gpg: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/libgpgme.so.11.24.1", added "/usr/lib/libgpgme.so.11.25.0"
Changes to packages/core2-32-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.12.1 to libgpgmepp.so.6.13.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.12.1 to libgpgmepp.so.6.13.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.24.1 to libgpgme.so.11.25.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.24.1 to libgpgme.so.11.25.0
  /usr/lib/libgpgmepp.so.6.12.1 moved to /usr/lib/libgpgmepp.so.6.13.0
  /usr/lib/libgpgme.so.11.24.1 moved to /usr/lib/libgpgme.so.11.25.0
  /usr/lib/python3.9/site-packages/gpg-1.15.1_unknown-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gpg-1.16.0_unknown-py3.9.egg-info

--===============0004159851504514505==--
