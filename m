Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32458.1624189110814209402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id BB18238C1314
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre: upgrading to 8.45 SUCCEEDED
Message-ID: <MADEUP.168A476422BECC29.3236@lists.openembedded.org>
X-Groupsio-MsgNum: 153119
Content-Type: multipart/mixed; boundary="===============4520479619297115102=="

--===============4520479619297115102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcre* to *8.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre-upgrade-8.44-8.45.patch
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

--===============4520479619297115102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c6894be38c47df52da08ded29ec6529136b65dcc"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c6894be38c47df52da08ded29ec6529136b65dcc"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 122 Local 77 Network 0 Missed 45 Current 631 (63% match, 94% complete)
Removing 45 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 15 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 639 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 640 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 650 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 671 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 672 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 673 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 683 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 706 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 707 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 708 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 709 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 919 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 710 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 1265 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1266 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 715 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 2044 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 2045 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 2046 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_lic)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_lic: Started
NOTE: Running setscene task 721 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_lic unihash changed to 19b94f2715efd7cdd298f88cfc02494badb44647f37b2e3bffb6dc5803f17e6d
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2051 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 724 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2118 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 735 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running task 2124 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running task 2130 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 278761f683d58654f46eeb60975397bcf0fc79ad68c8c25e0ee17d6d6bbad66b
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2155 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1fadc44bbb97006d7f8b62466dc5b890540a7ca4ef72a6e997187e3c55717d9e
NOTE: Running task 2156 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 743 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
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
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running setscene task 754 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2301 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 2306 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2307 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2308 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm)
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_qa)
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre-8.45-r0: task do_package_qa: Started
NOTE: recipe libpcre-8.45-r0: task do_package_qa: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Started
NOTE: recipe grep-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile_ptest_base)
NOTE: recipe grep-3.6-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_install)
NOTE: recipe grep-3.6-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2321 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to e9077ea17dfe2a003c0035af1be00437303102ddcb9593a4fe4acf545208a0cf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 760 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2324 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2325 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2326 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 8f8eb7dfd8cc15d5e5e0c2d21a10ec14b084697e37a065f54d365f30af4a2755
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to 2aa51811e2cd70a6f12bd269b7a5e878eb387d712d6a75056cbf8caaa07e5fc7
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to cb780250cb0bb095dc36c2a1efe4b9bf1cf18050f6ccd02137bd29806222f111
NOTE: Setscene tasks completed
NOTE: Running task 2365 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to a53a1b98d2f0b90c69bcc50145bcb8aedf9ee23a089100c488dfafc8e0f3bd8e
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to a8ad284e61c55c6ba73cd42941a019ad9e925efb6767e350a1bfdcbb17e91288
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to c38d828afcf60673e8a824fce754297a845830404893991ad51acd1e69748797
NOTE: Setscene tasks completed
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2374 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 09ed601d62d3e8cbbc095fad5078197aac1518daa896054acdc705b3a925561e
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2376 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 8de5c7c6ce5ec7a872b5f57fb6a8ff2c6a7ddc4c7e468dbc434ccb3b54cd3e87
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm became valid
NOTE: Running setscene task 797 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to 9559e850bba6e8ceee364071732fcbe3fef6855b647f867ac7fb9d89757d905a
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to c41aeecd0b20c986dd5d7c2ab83eaa58e716bc0520318d33367d24506e6edc72
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Running setscene task 798 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 800 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 801 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to e38c24d17708e2a860bc448a1f46d2ed9b4cce5db0d80a722f0f41e38b875d4a
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to ed268e8ab2c614b5e117602f0022a05436689c98d28e6dc3b2b23d42fc33fe77
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4520479619297115102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcre: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre: SRC_URI changed from "https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.bz2 file://run-ptest file://Makefile" to "https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.bz2 file://run-ptest file://Makefile"
packages/core2-32-poky-linux/libpcre: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-dbg: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-dbg: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-dbg: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-dbg: PKGSIZE changed from 2034840 to 2035060 (+0%)
packages/core2-32-poky-linux/libpcre/libpcre-dev: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-dev: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-dev: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-doc: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-doc: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-doc: PKGSIZE changed from 2300541 to 2301066 (+0%)
packages/core2-32-poky-linux/libpcre/libpcre-locale: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-locale: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-locale: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-ptest: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-ptest: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-ptest: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-ptest: PKGSIZE changed from 1891228 to 1891286 (+0%)
packages/core2-32-poky-linux/libpcre/libpcre-src: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-src: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-src: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre-src: PKGSIZE changed from 2283747 to 2283939 (+0%)
packages/core2-32-poky-linux/libpcre/libpcre-staticdev: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-staticdev: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcre-staticdev: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcre: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcrecpp: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcrecpp: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcrecpp: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/libpcreposix: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcreposix: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/libpcreposix: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/pcregrep-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcregrep-doc: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/pcregrep-doc: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/pcregrep: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcregrep: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/pcregrep: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/pcretest-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcretest-doc: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/pcretest-doc: PV changed from "8.44" to "8.45"
packages/core2-32-poky-linux/libpcre/pcretest: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcretest: PKGV changed from 8.44 [default] to 8.45 [default]
packages/core2-32-poky-linux/libpcre/pcretest: PV changed from "8.44" to "8.45"
Changes to packages/core2-32-poky-linux/libpcre (sysroot):
  /usr/lib/libpcre.so.1 changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so.1.2.12 moved to /usr/lib/libpcre.so.1.2.13
Changes to packages/x86_64-linux/libpcre-native (sysroot):
  /usr/lib/libpcre.so.1 changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so.1.2.12 moved to /usr/lib/libpcre.so.1.2.13

--===============4520479619297115102==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libpcre-upgrade-8.44-8.45.patch"

From bce5175e53580407aa0ad604075e81dfdd3fe186 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 10:42:23 +0000
Subject: [PATCH] libpcre: upgrade 8.44 -> 8.45

---
 .../{libpcre_8.44.bb => libpcre_8.45.bb}      | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.44.bb => libpcre_8.45.bb} (65%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
similarity index 65%
rename from meta/recipes-support/libpcre/libpcre_8.44.bb
rename to meta/recipes-support/libpcre/libpcre_8.45.bb
index cd80dc7345..8df71877bd 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -1,3 +1,51 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -19,13 +19,13 @@
+#  ---------------------------
+#  
+#  Written by:       Philip Hazel
+# -Email local part: ph10
+# -Email domain:     cam.ac.uk
+# +Email local part: Philip.Hazel
+# +Email domain:     gmail.com
+#  
+#  University of Cambridge Computing Service,
+#  Cambridge, England.
+#  
+# -Copyright (c) 1997-2020 University of Cambridge
+# +Copyright (c) 1997-2021 University of Cambridge
+#  All rights reserved.
+#  
+#  
+# @@ -36,7 +36,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2010-2020 Zoltan Herczeg
+# +Copyright(c) 2010-2021 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# @@ -47,7 +47,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2009-2020 Zoltan Herczeg
+# +Copyright(c) 2009-2021 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# 
+#
+
 DESCRIPTION = "The PCRE library is a set of functions that implement regular \
 expression pattern matching using the same syntax and semantics as Perl 5. PCRE \
 has its own native API, as well as a set of wrapper functions that correspond \
@@ -6,14 +54,13 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
 
-SRC_URI[md5sum] = "cf7326204cc46c755b5b2608033d9d24"
-SRC_URI[sha256sum] = "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
+SRC_URI[sha256sum] = "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.20.1


--===============4520479619297115102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcre/libpcre-dev: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-locale: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-ptest: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre-staticdev: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcre: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcrecpp: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/libpcreposix: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcregrep-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcregrep: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcretest-doc: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
packages/core2-32-poky-linux/libpcre/pcretest: FILELIST: removed "/usr/lib/libpcre.so.1.2.12", added "/usr/lib/libpcre.so.1.2.13"
Changes to packages/core2-32-poky-linux/libpcre (sysroot):
  /usr/lib/libpcre.so.1 changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so.1.2.12 moved to /usr/lib/libpcre.so.1.2.13
Changes to packages/x86_64-linux/libpcre-native (sysroot):
  /usr/lib/libpcre.so.1 changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so changed symlink target from libpcre.so.1.2.12 to libpcre.so.1.2.13
  /usr/lib/libpcre.so.1.2.12 moved to /usr/lib/libpcre.so.1.2.13

--===============4520479619297115102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c6894be38c47df52da08ded29ec6529136b65dcc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c6894be38c47df52da08ded29ec6529136b65dcc"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 123 Local 78 Network 0 Missed 45 Current 630 (63% match, 94% complete)
Removing 45 stale sstate objects for arch core2-64...done.
Removing 15 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 639 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 640 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 650 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 671 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 672 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 673 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 683 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 706 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 707 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 709 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 710 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 919 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1282 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 2044 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 2049 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 2050 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_setscene)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_lic: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_lic: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_lic unihash changed to 19b94f2715efd7cdd298f88cfc02494badb44647f37b2e3bffb6dc5803f17e6d
NOTE: Running task 2051 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 724 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2118 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 735 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running task 2130 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2139 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f3390a2fe49bc60b86c9dac8cfaf80751b5dfa0aa5f45e3bfe72541e1a12a8f6
NOTE: Running setscene task 740 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 742 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2170 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f09301e6f4ce77a3ef6061076714e0d150ee8ee0561dd4f291f3fc86c68e279b
NOTE: Running task 2171 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
ERROR: gdbm-1.19-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.20-r0 to 0:1.19-r0) [version-going-backwards]
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running setscene task 754 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2301 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 2306 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2307 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2308 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm)
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_qa)
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre-8.45-r0: task do_package_qa: Started
NOTE: recipe libpcre-8.45-r0: task do_package_qa: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Started
NOTE: recipe grep-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile_ptest_base)
NOTE: recipe grep-3.6-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_install)
NOTE: recipe grep-3.6-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Started
NOTE: recipe grep-3.6-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2322 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package)
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to 644c819a3ec83cddf5b5a58db8748ab4fa30737ce76e017d6012e4dee5ba31fe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Running setscene task 770 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2324 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2325 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2326 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 195106960d0b0d70b8367658d10e9c76fcc5fea85ee4b617a0fe06e17a358ea7
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to 869ae84bd48d9942b03c65b21961be0fdfe83372bceb5e52c4f0226d868e9a30
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to 8347ec07f7d2ee0576b43ab75d8dd41df6f2f2c19fbbff2465d4d23058ba948c
NOTE: Setscene tasks completed
NOTE: Running task 2365 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to e7107781a1fb788e9074940dbe6ab176797361970262f072cdfcc86b9427b32a
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to 5e26f0276ec71033c4a378c778250db9fdd96a223667a979b810a59d629d381b
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 0fd6082b687e87b04245bbdaa8896fa05b3ae6a8c2d3bd58375bd23cce724f12
NOTE: Setscene tasks completed
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2374 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 5dd97909835d6810ccf511eb4443b6d41e2bfb8f59e45be8096ffd1e6195198c
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2376 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 07014d18c8c545432dc21fc8f22bc9255a5d33ce1345e7a07f3f23b651fca8e8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm became valid
NOTE: Running setscene task 797 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to 99a3b2734a112d276d0dd69930f33f5127ebf3235caa3faec6518ec500790e00
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to 5b3218de47d1e049407a1e1851694122fbf1e80cc0f6912511834973fd593f98
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Running setscene task 798 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 799 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to 465d6ff4b204ca3d96f5203203c082cb79bd102797c466f49aa4576807c7715c
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to 0910c0e667a2f88f6a2470dece48697ca990b080cd58db0e52dd44a5101eaf76
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============4520479619297115102==--
