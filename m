Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5883.1626056249091349075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2603438C1179
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:28 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.1.1 SUCCEEDED
Message-ID: <MADEUP.1690E98B2556AC51.2174@lists.openembedded.org>
X-Groupsio-MsgNum: 153757
Content-Type: multipart/mixed; boundary="===============4969021410343942865=="

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.1.0-1.1.1.patch
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

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 61 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-a4a4166db4f4a4f389277a06f61126f5343f72b1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4a4166db4f4a4f389277a06f61126f5343f72b1"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 160 Local 100 Network 0 Missed 60 Current 649 (62% match, 92% complete)
Removing 6 stale sstate objects for arch qemumips...done.
Removing 26 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 657 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 685 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 691 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 693 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 696 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 700 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 701 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 702 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 703 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1272 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_fetch)
NOTE: Running task 1413 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_fetch)
NOTE: Running task 1449 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 1480 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1481 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1483 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_fetch)
NOTE: Running task 1488 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_fetch)
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Started
NOTE: Running task 1598 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_fetch)
NOTE: Running task 1599 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_fetch)
NOTE: Running task 1604 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_fetch)
NOTE: Running task 1605 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_fetch)
NOTE: Running task 1606 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_fetch)
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1637 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_unpack)
NOTE: Running task 1638 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 749 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 1699 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1700 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1701 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_unpack)
NOTE: Running task 1702 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1703 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1704 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Started
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 1705 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_unpack)
NOTE: Running task 1706 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Started
NOTE: Running task 1707 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_unpack)
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Started
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Succeeded
NOTE: recipe less-590-r0: task do_fetch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Started
NOTE: Running task 1759 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_unpack)
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_unpack)
NOTE: Running task 1789 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_unpack)
NOTE: recipe less-590-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Started
NOTE: Running task 1805 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Started
NOTE: Running task 1993 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_patch)
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Started
NOTE: Running task 1994 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_unpack)
NOTE: Running task 1995 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_unpack)
NOTE: Running task 1996 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1997 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Started
NOTE: Running task 1998 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_patch)
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Started
NOTE: recipe less-590-r0: task do_unpack: Started
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Started
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Succeeded
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1999 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_patch)
NOTE: recipe rng-tools-6.13-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe rng-tools-6.13-r0: task do_patch: Succeeded
NOTE: Running task 2001 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe less-590-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 2003 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 753 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2004 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2005 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Started
NOTE: recipe less-590-r0: task do_patch: Started
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Succeeded
NOTE: Running task 2006 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2007 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_patch)
NOTE: Running task 2008 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 754 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe openssh-8.6p1-r0: task do_patch: Started
NOTE: recipe groff-1.22.4-r1: task do_patch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 755 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe man-db-2.9.4-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssh-8.6p1-r0: task do_patch: Succeeded
NOTE: Running task 2010 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2023 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 761 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2024 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 2025 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic unihash changed to 143c65b70d11ce060b2a4518c83f8f419c145f24f36df755a30bb4e0a27d64eb
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2047 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2048 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2049 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2050 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2051 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_deploy_source_date_epoch)
NOTE: Running task 2052 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Succeeded
NOTE: Running task 2053 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2096 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2117 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_configure)
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2118 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: Running task 2119 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_patch: Succeeded
NOTE: Running task 2120 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2121 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_configure)
NOTE: recipe less-590-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2123 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure)
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2124 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2173 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2189 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_configure: Succeeded
NOTE: Running task 2195 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_compile)
NOTE: recipe less-590-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe less-590-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_install)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe less-590-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe less-590-r0: task do_install: Succeeded
NOTE: Running task 2198 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2200 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2202 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2203 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2204 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2205 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2206 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_configure: Started
NOTE: recipe less-590-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_packagedata)
NOTE: recipe less-590-r0: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2208 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe less-590-r0: task do_packagedata: Succeeded
NOTE: Running task 2209 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package_write_rpm)
NOTE: recipe less-590-r0: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2212 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile)
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe less-590-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2223 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2232 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2238 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe rng-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2239 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe rng-tools-6.13-r0: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2245 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package)
NOTE: Running task 2246 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_compile: Succeeded
NOTE: Running task 2259 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_install)
NOTE: recipe rng-tools-6.13-r0: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package)
NOTE: recipe rng-tools-6.13-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_configure: Succeeded
NOTE: Running task 2262 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_compile)
NOTE: recipe groff-1.22.4-r1: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2263 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2265 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2266 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2267 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2268 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2269 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2270 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_packagedata)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2272 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_install)
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2288 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package)
NOTE: Running task 2289 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2291 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_packagedata)
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2293 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_compile)
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_configure)
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_install)
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5aee81357375e47dc74dc1ce0f9da0415214c11d6cfe8e8cec85f100f054322d
NOTE: Running task 2309 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_compile)
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2311 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1ba205c5dff935439a6ba9665c1d19358d3b94d9a604c5237ddb3df6adced49e
NOTE: Running task 2312 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure)
NOTE: recipe openssh-8.6p1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_install)
NOTE: recipe libgit2-1.1.1-r0: task do_install: Started
NOTE: recipe libgit2-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package)
NOTE: Running task 2316 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Succeeded
NOTE: Running task 2317 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package)
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Succeeded
NOTE: Running task 2323 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_packagedata)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2324 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_qa)
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2332 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile)
NOTE: recipe openssh-8.6p1-r0: task do_compile: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2334 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_install: Started
NOTE: recipe groff-1.22.4-r1: task do_compile: Succeeded
NOTE: Running task 2335 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_install)
NOTE: recipe groff-1.22.4-r1: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2341 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe openssh-8.6p1-r0: task do_package: Started
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-staticdev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dev went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-doc went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
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
NOTE: Running setscene task 810 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2473 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_configure)
NOTE: recipe man-db-2.9.4-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_install: Succeeded
NOTE: Running task 2532 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package)
NOTE: recipe groff-1.22.4-r1: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_package: Succeeded
NOTE: Running task 2533 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_packagedata)
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Started
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2534 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package_write_rpm)
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Started
NOTE: recipe groff-1.22.4-r1: task do_package: Succeeded
NOTE: Running task 2535 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_packagedata)
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package_write_rpm)
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_compile)
NOTE: recipe man-db-2.9.4-r0: task do_compile: Started
NOTE: recipe man-db-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_install)
NOTE: recipe man-db-2.9.4-r0: task do_install: Started
NOTE: recipe man-db-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package)
NOTE: recipe man-db-2.9.4-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_packagedata)
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Started
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package_write_rpm)
NOTE: Running task 2542 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2543 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2543 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 160 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (820 cached, 1 parsed). 1458 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a4a4166db4f4a4f389277a06f61126f5343f72b1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4a4166db4f4a4f389277a06f61126f5343f72b1"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 158 Local 98 Network 0 Missed 60 Current 651 (62% match, 92% complete)
Removing 26 stale sstate objects for arch core2-64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 668 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 672 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 681 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 693 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 695 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 701 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 702 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 703 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 706 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running task 1272 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_fetch)
NOTE: Running task 1413 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_fetch)
NOTE: Running task 1449 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 1481 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1482 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1483 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_fetch)
NOTE: Running task 1488 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_fetch)
NOTE: Running task 1602 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_fetch)
NOTE: Running task 1603 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_fetch)
NOTE: Running task 1604 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_fetch)
NOTE: Running task 1605 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_fetch)
NOTE: Running task 1606 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_fetch)
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_unpack)
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1978 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1979 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Started
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1980 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_unpack)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1981 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_unpack)
NOTE: Running task 1983 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 1985 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Started
NOTE: recipe rng-tools-6.13-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1987 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_unpack)
NOTE: Running task 1988 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1989 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_unpack)
NOTE: recipe rng-tools-6.13-r0: task do_patch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1990 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1991 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_patch)
NOTE: recipe less-590-r0: task do_fetch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Started
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Started
NOTE: recipe less-590-r0: task do_fetch: Succeeded
NOTE: Running task 1992 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_unpack)
NOTE: Running task 1993 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1994 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_patch)
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 1995 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_unpack)
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1996 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1997 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe less-590-r0: task do_unpack: Started
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Started
NOTE: recipe less-590-r0: task do_unpack: Succeeded
NOTE: Running task 1998 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_patch)
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1999 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_unpack)
NOTE: Running task 2000 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2001 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 2002 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2003 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic)
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_patch)
NOTE: recipe groff-1.22.4-r1: task do_fetch: Succeeded
NOTE: Running task 2005 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_unpack)
NOTE: Running task 2006 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-590-r0: task do_patch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe man-db-2.9.4-r0: task do_patch: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Started
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic unihash changed to 143c65b70d11ce060b2a4518c83f8f419c145f24f36df755a30bb4e0a27d64eb
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2007 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe man-db-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2008 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 2009 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_patch)
NOTE: Running task 2010 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Succeeded
NOTE: Running task 2011 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_patch)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 749 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 751 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 753 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 754 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Succeeded
NOTE: Running task 2012 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_patch)
NOTE: recipe openssh-8.6p1-r0: task do_patch: Started
NOTE: recipe openssh-8.6p1-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Succeeded
NOTE: Running task 2014 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_patch)
NOTE: recipe groff-1.22.4-r1: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 757 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 758 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2097 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2098 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 762 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2111 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2112 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe groff-1.22.4-r1: task do_patch: Succeeded
NOTE: Running task 2113 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2114 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_configure)
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2115 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2116 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe less-590-r0: task do_configure: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2117 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_configure)
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2118 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure)
NOTE: Running task 2119 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2120 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_configure)
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 771 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2133 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2189 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_compile)
NOTE: recipe less-590-r0: task do_compile: Started
NOTE: recipe less-590-r0: task do_compile: Succeeded
NOTE: Running task 2191 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_install)
NOTE: recipe less-590-r0: task do_install: Started
NOTE: recipe less-590-r0: task do_install: Succeeded
NOTE: Running task 2192 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2193 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2194 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2200 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2202 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe less-590-r0: task do_package: Succeeded
NOTE: Running task 2203 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_packagedata)
NOTE: recipe less-590-r0: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2204 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2205 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe less-590-r0: task do_packagedata: Succeeded
NOTE: Running task 2206 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package_write_rpm)
NOTE: recipe less-590-r0: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2207 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2209 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe less-590-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2212 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2213 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2215 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2216 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe rng-tools-6.13-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_install)
NOTE: recipe rng-tools-6.13-r0: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2219 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_install: Started
NOTE: recipe rng-tools-6.13-r0: task do_install: Succeeded
NOTE: Running task 2220 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package)
NOTE: recipe rng-tools-6.13-r0: task do_package: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_compile)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2223 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package)
NOTE: Running task 2224 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2225 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 2226 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_install)
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_compile)
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package)
NOTE: Running task 2230 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2231 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_packagedata)
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_packagedata)
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_packagedata)
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2237 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_configure)
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2238 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_compile)
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Succeeded
NOTE: Running task 2239 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_compile)
NOTE: recipe groff-1.22.4-r1: task do_compile: Started
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_install)
NOTE: recipe libgit2-1.1.1-r0: task do_install: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_install)
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Started
NOTE: recipe libgit2-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package)
NOTE: Running task 2243 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Succeeded
NOTE: Running task 2244 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package)
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Succeeded
NOTE: Running task 2245 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_packagedata)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2246 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2247 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2248 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_qa)
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2249 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2267 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2317 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2318 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dabf505693ad0159cbe77fbdafa5f556db7151d2c6d49eedb0615e89417b5252
NOTE: Running task 2319 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure)
NOTE: recipe openssh-8.6p1-r0: task do_configure: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2325 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 73d88f4e8b858d1118c121c8b4f8d71ef1c1f032f356d1be99797c697f234ee2
NOTE: Running task 2326 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running setscene task 810 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2466 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_configure)
NOTE: recipe man-db-2.9.4-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_compile: Succeeded
NOTE: Running task 2525 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_install)
NOTE: recipe groff-1.22.4-r1: task do_install: Started
NOTE: recipe groff-1.22.4-r1: task do_install: Succeeded
NOTE: Running task 2526 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package)
NOTE: recipe groff-1.22.4-r1: task do_package: Started
NOTE: recipe groff-1.22.4-r1: task do_package: Succeeded
NOTE: Running task 2527 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_packagedata)
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Succeeded
NOTE: Running task 2528 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package_write_rpm)
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2530 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile)
NOTE: recipe openssh-8.6p1-r0: task do_compile: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile: Succeeded
NOTE: Running task 2531 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2532 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_install: Succeeded
NOTE: Running task 2533 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2534 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package)
NOTE: recipe openssh-8.6p1-r0: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_package: Succeeded
NOTE: Running task 2535 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_packagedata)
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Started
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package_write_rpm)
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_compile)
NOTE: recipe man-db-2.9.4-r0: task do_compile: Started
NOTE: recipe man-db-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_install)
NOTE: recipe man-db-2.9.4-r0: task do_install: Started
NOTE: recipe man-db-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package)
NOTE: recipe man-db-2.9.4-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_packagedata)
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Started
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package_write_rpm)
NOTE: Running task 2542 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2543 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2543 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 52 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-a4a4166db4f4a4f389277a06f61126f5343f72b1"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4a4166db4f4a4f389277a06f61126f5343f72b1"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 161 Local 101 Network 0 Missed 60 Current 648 (62% match, 92% complete)
Removing 28 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 8 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 652 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 653 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 678 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 684 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 688 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 690 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 696 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 698 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 699 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 709 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1271 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_fetch)
NOTE: Running task 1409 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_fetch)
NOTE: Running task 1445 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 1475 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1476 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1478 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_fetch)
NOTE: Running task 1483 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_fetch)
NOTE: Running task 1591 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_fetch)
NOTE: Running task 1592 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_fetch)
NOTE: Running task 1593 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_fetch)
NOTE: Running task 1594 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_fetch)
NOTE: Running task 1599 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_fetch)
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_unpack)
NOTE: Running task 1691 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Started
NOTE: Running task 1796 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 1797 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1808 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_unpack)
NOTE: Running task 1809 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1826 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Started
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Started
NOTE: Running task 1847 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_unpack)
NOTE: recipe less-590-r0: task do_fetch: Started
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_unpack)
NOTE: recipe groff-1.22.4-r1: task do_fetch: Succeeded
NOTE: recipe less-590-r0: task do_fetch: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Succeeded
NOTE: Running task 1895 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_unpack)
NOTE: Running task 1896 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_unpack)
NOTE: Running task 1897 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_unpack)
NOTE: Running task 1898 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_unpack)
NOTE: Running task 1899 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1900 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1901 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_unpack: Started
NOTE: Running task 1986 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Started
NOTE: Running setscene task 744 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running task 1987 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_patch)
NOTE: recipe less-590-r0: task do_unpack: Started
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1988 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_unpack)
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Started
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1989 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe less-590-r0: task do_unpack: Succeeded
NOTE: Running task 1990 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_patch)
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1992 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Started
NOTE: Running setscene task 745 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe less-590-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: Running setscene task 746 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 747 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 748 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 749 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Succeeded
NOTE: Running task 1993 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_patch)
NOTE: recipe groff-1.22.4-r1: task do_unpack: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1994 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_patch)
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1995 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 1996 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe groff-1.22.4-r1: task do_patch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 1999 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2000 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic)
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssh-8.6p1-r0: task do_patch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Started
NOTE: Running task 2001 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic unihash changed to 143c65b70d11ce060b2a4518c83f8f419c145f24f36df755a30bb4e0a27d64eb
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2002 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_patch: Started
NOTE: recipe man-db-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2004 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2017 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_patch)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 753 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 2024 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: recipe less-590-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2026 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running noexec task 2031 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2032 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2087 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2095 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2101 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2102 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2107 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_patch: Succeeded
NOTE: Running task 2108 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_configure)
NOTE: recipe less-590-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2110 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2111 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure)
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2112 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_configure)
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 762 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2125 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2126 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2127 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2189 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe less-590-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe less-590-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 2195 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe less-590-r0: task do_compile: Succeeded
NOTE: Running task 2200 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_install)
NOTE: recipe less-590-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe less-590-r0: task do_install: Succeeded
NOTE: Running task 2201 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2202 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2204 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile)
NOTE: Running task 2205 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2206 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2207 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_configure: Started
NOTE: recipe less-590-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: recipe less-590-r0: task do_packagedata: Started
NOTE: Running task 2210 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe less-590-r0: task do_packagedata: Succeeded
NOTE: Running task 2211 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2212 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe less-590-r0: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2213 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe less-590-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2214 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2216 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package)
NOTE: Running task 2217 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2218 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_install)
NOTE: recipe groff-1.22.4-r1: task do_configure: Succeeded
NOTE: Running task 2220 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_install: Started
NOTE: recipe groff-1.22.4-r1: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package)
NOTE: recipe rng-tools-6.13-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libssh2-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2228 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2230 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2231 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2232 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2233 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2234 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2240 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2251 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2274 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_install)
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 798 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2290 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2291 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package)
NOTE: Running task 2292 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_install)
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_install: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package)
NOTE: Running task 2296 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2298 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2299 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Succeeded
NOTE: Running task 2300 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_install)
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f65cba28dda80dce1f2749d91bd589828425857f2542302d949145a6c87a2bb
NOTE: Running task 2301 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure)
NOTE: recipe openssh-8.6p1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2315 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2316 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2317 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_qa)
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package)
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2323 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f1e9d25143136ff89df75508547a4b21e157890b8aa17cc5fc7c213b42812a51
NOTE: Running task 2324 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_packagedata)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running setscene task 810 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2466 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_configure)
NOTE: recipe man-db-2.9.4-r0: task do_configure: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure: Succeeded
NOTE: Running task 2525 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure_ptest_base)
NOTE: recipe groff-1.22.4-r1: task do_compile: Succeeded
NOTE: Running task 2526 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2527 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile)
NOTE: recipe groff-1.22.4-r1: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile: Started
NOTE: recipe groff-1.22.4-r1: task do_install: Succeeded
NOTE: Running task 2528 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package)
NOTE: recipe groff-1.22.4-r1: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile: Succeeded
NOTE: Running task 2529 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2530 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_install: Succeeded
NOTE: Running task 2531 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2532 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package)
NOTE: recipe openssh-8.6p1-r0: task do_package: Started
NOTE: recipe groff-1.22.4-r1: task do_package: Succeeded
NOTE: Running task 2533 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_packagedata)
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Succeeded
NOTE: Running task 2534 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package_write_rpm)
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_package: Succeeded
NOTE: Running task 2535 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_packagedata)
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Started
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package_write_rpm)
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_compile)
NOTE: recipe man-db-2.9.4-r0: task do_compile: Started
NOTE: recipe man-db-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_install)
NOTE: recipe man-db-2.9.4-r0: task do_install: Started
NOTE: recipe man-db-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package)
NOTE: recipe man-db-2.9.4-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_packagedata)
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Started
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package_write_rpm)
NOTE: Running task 2542 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2543 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2543 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2-dev: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.1 changed symlink target from libgit2.so.1.1.0 to libgit2.so.1.1.1
  /usr/lib/libgit2.so.1.1.0 moved to /usr/lib/libgit2.so.1.1.1

--===============4969021410343942865==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.1.0-1.1.1.patch"

From 364ed58f8529ef565ecf24c5bf16ae2862263fc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 12 Jul 2021 02:17:26 +0000
Subject: [PATCH] libgit2: upgrade 1.1.0 -> 1.1.1

---
 .../libgit2/{libgit2_1.1.0.bb => libgit2_1.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.1.0.bb => libgit2_1.1.1.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.1.0.bb b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.1.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.1.1.bb
index 2bbf59ea74..ae30a7a100 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
-SRCREV = "7f4fa178629d559c037a1f72f79f79af9c1ef8ce"
+SRCREV = "8a0dc6783c340e61a44c179c48f832165ad2053c"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a4a4166db4f4a4f389277a06f61126f5343f72b1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4a4166db4f4a4f389277a06f61126f5343f72b1"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 161 Local 101 Network 0 Missed 60 Current 648 (62% match, 92% complete)
Removing 8 stale sstate objects for arch qemuppc...done.
Removing 28 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 652 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 653 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 678 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 684 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 688 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 690 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 696 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 698 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 699 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 709 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running task 1271 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_fetch)
NOTE: Running task 1409 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_fetch)
NOTE: Running task 1445 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 1476 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1477 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1478 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_fetch)
NOTE: Running task 1483 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_fetch)
NOTE: Running task 1595 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_fetch)
NOTE: Running task 1596 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_fetch)
NOTE: Running task 1597 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_fetch)
NOTE: Running task 1598 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_fetch)
NOTE: Running task 1599 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_fetch)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1969 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_unpack)
NOTE: Running task 1970 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 1972 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1973 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1974 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1975 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_unpack)
NOTE: Running task 1976 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 1977 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_unpack)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1978 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1979 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 744 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 745 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1980 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_unpack)
NOTE: recipe less-590-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 746 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe less-590-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_unpack)
NOTE: Running task 1982 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 747 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_unpack)
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe less-590-r0: task do_unpack: Started
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_unpack)
NOTE: Running task 1985 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe groff-1.22.4-r1: task do_fetch: Succeeded
NOTE: Running task 1986 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_unpack)
NOTE: Running task 1987 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Started
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe less-590-r0: task do_unpack: Succeeded
NOTE: Running task 1988 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_patch)
NOTE: recipe less-590-r0: task do_patch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 1989 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 748 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_unpack)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_patch)
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 749 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1992 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 1993 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: Running setscene task 750 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Succeeded
NOTE: Running task 1994 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_patch)
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 751 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe openssh-8.6p1-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Succeeded
NOTE: Running task 1995 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 753 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_unpack: Succeeded
NOTE: Running task 1996 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_patch)
NOTE: recipe groff-1.22.4-r1: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_patch: Succeeded
NOTE: Running task 2070 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2071 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_patch)
NOTE: recipe man-db-2.9.4-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2076 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe man-db-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2077 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 760 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_patch)
NOTE: recipe rng-tools-6.13-r0: task do_patch: Started
NOTE: recipe rng-tools-6.13-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-590-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running noexec task 2100 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2101 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: Running task 2102 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2103 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe groff-1.22.4-r1: task do_patch: Succeeded
NOTE: Running task 2104 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2106 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Started
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2107 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe less-590-r0: task do_configure: Started
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2108 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_configure)
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2110 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2112 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_configure)
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2117 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_patch)
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2118 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 2119 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2120 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic)
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic unihash changed to 143c65b70d11ce060b2a4518c83f8f419c145f24f36df755a30bb4e0a27d64eb
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2125 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe less-590-r0: task do_configure: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 2165 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: Running task 2172 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: Running task 2184 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_compile)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe less-590-r0: task do_compile: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2192 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2193 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe less-590-r0: task do_compile: Succeeded
NOTE: Running task 2194 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_install)
NOTE: recipe less-590-r0: task do_install: Started
NOTE: recipe less-590-r0: task do_install: Succeeded
NOTE: Running task 2195 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2196 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2202 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2203 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Started
NOTE: Running task 2204 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2206 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_install: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2208 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package)
NOTE: Running task 2209 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_package: Started
NOTE: Running task 2210 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_configure: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_compile)
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Succeeded
NOTE: Running task 2213 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_compile)
NOTE: recipe groff-1.22.4-r1: task do_compile: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_compile)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_install)
NOTE: recipe rng-tools-6.13-r0: task do_install: Started
NOTE: recipe rng-tools-6.13-r0: task do_install: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2219 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2224 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_packagedata)
NOTE: Running task 2226 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.13-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe less-590-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2228 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe less-590-r0: task do_packagedata: Succeeded
NOTE: Running task 2229 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package_write_rpm)
NOTE: recipe less-590-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package)
NOTE: Running task 2231 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_packagedata)
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2233 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_packagedata)
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe less-590-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2237 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Succeeded
NOTE: Running task 2238 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_install)
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_configure)
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package)
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_compile)
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Started
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2242 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_install)
NOTE: recipe libgit2-1.1.1-r0: task do_install: Started
NOTE: recipe libgit2-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2243 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package)
NOTE: Running task 2244 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2250 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2252 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_qa)
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Succeeded
NOTE: Running task 2253 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_packagedata)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2254 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2267 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe groff-1.22.4-r1: task do_compile: Succeeded
NOTE: Running task 2290 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_install)
NOTE: recipe groff-1.22.4-r1: task do_install: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2291 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2292 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c1c52421c558a99d97195d8181d7a47dd8c9fee192eda9baa2db4e82002169fa
NOTE: Running task 2308 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_install: Succeeded
NOTE: Running task 2321 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package)
NOTE: recipe groff-1.22.4-r1: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure)
NOTE: recipe openssh-8.6p1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2323 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28ff717d10eeb38c6dd88776fdf8d650da378f92a7dd91f56cc79b1cc5c8dd0f
NOTE: Running task 2324 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_package: Succeeded
NOTE: Running task 2329 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_packagedata)
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2335 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile)
NOTE: recipe openssh-8.6p1-r0: task do_compile: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile: Succeeded
NOTE: Running task 2336 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2337 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_install: Succeeded
NOTE: Running task 2338 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running setscene task 810 of 809 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2474 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2526 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2533 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package)
NOTE: recipe openssh-8.6p1-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2534 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_configure)
NOTE: recipe man-db-2.9.4-r0: task do_configure: Started
NOTE: recipe openssh-8.6p1-r0: task do_package: Succeeded
NOTE: Running task 2535 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_packagedata)
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package_write_rpm)
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_compile)
NOTE: recipe man-db-2.9.4-r0: task do_compile: Started
NOTE: recipe man-db-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_install)
NOTE: recipe man-db-2.9.4-r0: task do_install: Started
NOTE: recipe man-db-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package)
NOTE: recipe man-db-2.9.4-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_packagedata)
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Started
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package_write_rpm)
NOTE: Running task 2542 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2543 of 2543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2543 tasks of which 2390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 166 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 43 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-32 sysroot...done.
Removing 122 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a4a4166db4f4a4f389277a06f61126f5343f72b1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4a4166db4f4a4f389277a06f61126f5343f72b1"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 606 Local 545 Network 0 Missed 61 Current 214 (89% match, 92% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 288 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 311 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 325 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 327 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 332 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 333 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 349 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 352 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 376 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 379 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 392 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 395 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 397 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 399 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 737 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_fetch)
NOTE: Running task 758 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_fetch)
NOTE: Running task 765 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 772 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 773 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 774 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_fetch)
NOTE: Running task 779 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_fetch)
NOTE: Running task 796 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_fetch)
NOTE: Running task 797 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_fetch)
NOTE: Running task 798 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_fetch)
NOTE: Running task 799 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_fetch)
NOTE: Running task 800 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_fetch)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe less-590-r0: task do_fetch: Started
NOTE: recipe groff-1.22.4-r1: task do_fetch: Started
NOTE: Running task 939 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_unpack)
NOTE: Running task 940 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Started
NOTE: Running task 941 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_unpack)
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_fetch: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_fetch: Succeeded
NOTE: Running task 942 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 943 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_unpack)
NOTE: recipe less-590-r0: task do_fetch: Succeeded
NOTE: Running task 948 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 953 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 954 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_unpack)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: Running task 955 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_unpack)
NOTE: Running task 956 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Started
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Started
NOTE: recipe groff-1.22.4-r1: task do_unpack: Started
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Started
NOTE: recipe less-590-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Started
NOTE: recipe libgit2-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_unpack)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe less-590-r0: task do_unpack: Succeeded
NOTE: Running task 977 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_patch)
NOTE: Running task 978 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 429 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 983 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Started
NOTE: recipe less-590-r0: task do_patch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_fetch: Succeeded
NOTE: Running task 984 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_unpack)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libssh2-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 985 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Started
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 994 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 443 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_patch)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_unpack: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running task 1015 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_patch)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe less-590-r0: task do_patch: Succeeded
NOTE: Running task 1024 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_deploy_source_date_epoch)
NOTE: recipe libpipeline-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1025 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.6p1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: Running task 1027 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_patch)
NOTE: Running task 1028 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_patch: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1040 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssh-8.6p1-r0: task do_patch: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_patch)
NOTE: recipe less-590-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_patch: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 475 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe sudo-1.9.7p1-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1062 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 485 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 488 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssh-8.6p1-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_deploy_source_date_epoch)
NOTE: recipe sudo-1.9.7p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.13-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_patch)
NOTE: recipe libssh2-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 1083 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_patch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe man-db-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssh-8.6p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_patch: Succeeded
NOTE: Running task 1119 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe groff-1.22.4-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1156 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_patch)
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Started
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 1162 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic)
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_lic unihash changed to 143c65b70d11ce060b2a4518c83f8f419c145f24f36df755a30bb4e0a27d64eb
NOTE: recipe libgit2-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1258 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1263 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1264 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1304 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1329 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1334 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 692 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running setscene task 704 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running task 1360 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
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
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-es went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ja went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pl went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pt-br went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ru went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sr went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sv went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-uk went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: Running setscene task 745 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-vi went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1414 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1439 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ca17797dcb58838ff90c4eb78986bc0e3463a242f2c6801bddee43de51bfe2c9
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1452 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 796 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 818 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1973 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2116 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2159 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2160 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2162 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2212 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2213 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2214 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2372 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2373 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe libssh2-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: Running task 2376 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libpipeline-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe less-590-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_configure)
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Started
NOTE: recipe less-590-r0: task do_configure: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2379 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_configure)
NOTE: recipe groff-1.22.4-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_configure)
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 90d527c965ea68cb21fb129de4b81bdaefc2f7e60a656fb921a1df77119a739f
NOTE: Running task 2417 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2487 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2488 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure)
NOTE: recipe openssh-8.6p1-r0: task do_configure: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2489 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2490 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe less-590-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_compile)
NOTE: recipe less-590-r0: task do_compile: Started
NOTE: recipe less-590-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_install)
NOTE: recipe less-590-r0: task do_install: Started
NOTE: recipe less-590-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package)
NOTE: recipe less-590-r0: task do_package: Started
NOTE: recipe less-590-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_packagedata)
NOTE: recipe less-590-r0: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: recipe less-590-r0: task do_packagedata: Succeeded
NOTE: Running task 2495 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: Running task 2496 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/less/less_590.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe less-590-r0: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2497 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe less-590-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2499 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure_ptest_base)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2500 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2501 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2502 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2503 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2504 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2505 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2507 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2508 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2509 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe groff-1.22.4-r1: task do_configure: Succeeded
NOTE: Running task 2510 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_compile)
NOTE: recipe groff-1.22.4-r1: task do_compile: Started
NOTE: recipe libssh2-1.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2511 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package)
NOTE: Running task 2512 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package: Started
NOTE: recipe libssh2-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_packagedata)
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2514 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libssh2-1.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe rng-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2515 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_compile)
NOTE: recipe rng-tools-6.13-r0: task do_compile: Started
NOTE: recipe rng-tools-6.13-r0: task do_compile: Succeeded
NOTE: Running task 2516 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_install)
NOTE: recipe rng-tools-6.13-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2517 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2518 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.13-r0: task do_install: Succeeded
NOTE: Running task 2519 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package)
NOTE: recipe rng-tools-6.13-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2520 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2521 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_configure)
NOTE: recipe rng-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.13.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_compile)
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Started
NOTE: recipe libgit2-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_compile)
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2528 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_install)
NOTE: recipe libgit2-1.1.1-r0: task do_install: Started
NOTE: recipe libgit2-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2529 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package)
NOTE: Running task 2530 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.1.1-r0: task do_package: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_packagedata)
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2533 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_package_qa)
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2534 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_compile)
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpipeline-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_install)
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package)
NOTE: Running task 2537 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_install)
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2539 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2540 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_configure)
NOTE: recipe man-db-2.9.4-r0: task do_configure: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_packagedata)
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb:do_package_write_rpm)
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure: Succeeded
NOTE: Running task 2543 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_configure_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2544 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile)
NOTE: recipe openssh-8.6p1-r0: task do_compile: Started
NOTE: recipe libpipeline-1.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_compile_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2546 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install)
NOTE: recipe openssh-8.6p1-r0: task do_install: Started
NOTE: recipe openssh-8.6p1-r0: task do_install: Succeeded
NOTE: Running task 2547 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_install_ptest_base)
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Started
NOTE: recipe openssh-8.6p1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2548 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package)
NOTE: recipe openssh-8.6p1-r0: task do_package: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_install: Succeeded
NOTE: Running task 2549 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package)
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Started
NOTE: recipe openssh-8.6p1-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_packagedata)
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Started
NOTE: recipe openssh-8.6p1-r0: task do_packagedata: Succeeded
NOTE: recipe sudo-1.9.7p1-r0: task do_package: Succeeded
NOTE: Running task 2551 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_packagedata)
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_packagedata: Succeeded
NOTE: Running task 2552 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.7p1.bb:do_package_write_rpm)
NOTE: Running task 2553 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.6p1.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Started
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Started
NOTE: recipe sudo-1.9.7p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssh-8.6p1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe groff-1.22.4-r1: task do_compile: Succeeded
NOTE: Running task 2554 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_install)
NOTE: recipe groff-1.22.4-r1: task do_install: Started
NOTE: recipe groff-1.22.4-r1: task do_install: Succeeded
NOTE: Running task 2555 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package)
NOTE: recipe groff-1.22.4-r1: task do_package: Started
NOTE: recipe groff-1.22.4-r1: task do_package: Succeeded
NOTE: Running task 2556 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_packagedata)
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Started
NOTE: recipe groff-1.22.4-r1: task do_packagedata: Succeeded
NOTE: Running task 2557 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/groff/groff_1.22.4.bb:do_package_write_rpm)
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Started
NOTE: recipe groff-1.22.4-r1: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2558 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_compile)
NOTE: recipe man-db-2.9.4-r0: task do_compile: Started
NOTE: recipe man-db-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2559 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_install)
NOTE: recipe man-db-2.9.4-r0: task do_install: Started
NOTE: recipe man-db-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package)
NOTE: recipe man-db-2.9.4-r0: task do_package: Started
NOTE: recipe man-db-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2561 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_packagedata)
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Started
NOTE: recipe man-db-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2562 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-db/man-db_2.9.4.bb:do_package_write_rpm)
NOTE: Running task 2563 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_package_write_rpm)
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe libssh2-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe man-db-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2564 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2564 tasks of which 2405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4969021410343942865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 3531172 to 3522764 (-0%)
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 707523 to 708007 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dev: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 3714345 to 3719018 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-src: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.1.0", added "/usr/lib/libgit2.so.1.1.1"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.1 changed symlink target from libgit2.so.1.1.0 to libgit2.so.1.1.1
  /usr/lib/libgit2.so.1.1.0 moved to /usr/lib/libgit2.so.1.1.1

--===============4969021410343942865==--
