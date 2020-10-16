Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12522.1602843683179347150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 25A5E38C1688
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.66.0 SUCCEEDED
Message-ID: <MADEUP.163E71D67F944DAC.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143425
Content-Type: multipart/mixed; boundary="===============4663418285373095825=="

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.66.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.64.3-2.66.0.patch
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

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 3870 to 6224 (+61%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 7137 to 9938 (+39%)

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1383 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (783 cached, 1 parsed). 1353 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:309b45ad0bd676a63ff2d968850c8a8485b8bae9"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 77 Found 49 Missed 28 Current 660 (63% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 664 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 958 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 1056 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1118 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1127 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_fetch)
NOTE: Running task 1140 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1309 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: Running task 1368 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_unpack)
NOTE: Running task 1374 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1953 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2060 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: Running task 2061 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic)
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2064 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic unihash changed to e1bdfa684d4361f73b582e27b4979f01d79d835ed6912fe3c07093fc56048623
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 2065 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_patch)
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2066 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2068 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2069 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2070 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_configure)
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_compile)
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_install)
NOTE: recipe gnutls-3.6.14-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package)
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata)
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1371 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:309b45ad0bd676a63ff2d968850c8a8485b8bae9"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 77 Found 49 Missed 28 Current 660 (63% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 664 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 958 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 1056 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1118 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1127 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_fetch)
NOTE: Running task 1140 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1221 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1361 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: Running task 1362 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 1375 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 718 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: Running task 1584 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1797 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: Running setscene task 720 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1799 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: Running task 1881 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2064 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic unihash changed to e1bdfa684d4361f73b582e27b4979f01d79d835ed6912fe3c07093fc56048623
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2074 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2080 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2087 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2088 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_configure)
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_compile)
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_install)
NOTE: recipe gnutls-3.6.14-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package)
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata)
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1370 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 46 skipped, 0 masked, 0 errors.
Removing 110 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:309b45ad0bd676a63ff2d968850c8a8485b8bae9"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 561 Found 533 Missed 28 Current 187 (95% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 188 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 190 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 191 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 252 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 253 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 254 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 255 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 256 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 262 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 263 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 293 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 299 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 336 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 353 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 518 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 558 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 566 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 569 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_fetch)
NOTE: Running task 577 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: Running task 628 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 777 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 801 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_unpack)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 810 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 819 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 825 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 408 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 912 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 430 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running task 925 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 944 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 949 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 970 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 980 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic unihash changed to e1bdfa684d4361f73b582e27b4979f01d79d835ed6912fe3c07093fc56048623
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1033 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_patch)
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Started
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 532 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1049 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 535 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 628 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 651 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 689 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 729 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 748 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1621 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1678 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2278 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2279 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2280 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2283 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2285 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2287 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2288 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2290 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2291 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2292 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2293 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2295 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2296 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2300 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2301 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_configure)
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_compile)
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_install)
NOTE: recipe gnutls-3.6.14-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package)
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2309 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2310 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2312 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2314 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Succeeded
NOTE: Running task 2315 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata)
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2316 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 2317 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2318 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: Running task 2319 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: Running task 2322 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2323 of 2323 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2323 tasks of which 2253 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1371 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:309b45ad0bd676a63ff2d968850c8a8485b8bae9"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 80 Found 52 Missed 28 Current 657 (65% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 661 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 958 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running task 1056 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1118 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1127 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_fetch)
NOTE: Running task 1140 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running task 1256 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1257 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1322 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1323 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Started
NOTE: Running task 1372 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1380 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running setscene task 718 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 720 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1618 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2051 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2060 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: Running task 2061 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2064 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic unihash changed to e1bdfa684d4361f73b582e27b4979f01d79d835ed6912fe3c07093fc56048623
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_patch)
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2074 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2075 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2076 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2077 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2078 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_configure)
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_compile)
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_install)
NOTE: recipe gnutls-3.6.14-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package)
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============4663418285373095825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.64.3-2.66.0.patch"

From 3bbf6ff30486b33ac6290b962ef1fa336ecff24b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 01:40:25 +0000
Subject: [PATCH] glib-networking: upgrade 2.64.3 -> 2.66.0

---
 .../{glib-networking_2.64.3.bb => glib-networking_2.66.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.64.3.bb => glib-networking_2.66.0.bb} (89%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
similarity index 89%
rename from meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
index 074389f552..230932daf0 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "eb382907ec941fe2fb1a9676b75acf7a"
-SRC_URI[archive.sha256sum] = "937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168"
+SRC_URI[archive.sha256sum] = "c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099"
 
 PACKAGECONFIG ??= "gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.18.4


--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1371 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:309b45ad0bd676a63ff2d968850c8a8485b8bae9"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 79 Found 51 Missed 28 Current 658 (64% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 662 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 689 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 958 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 1056 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1118 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1127 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_fetch)
NOTE: Running task 1140 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 717 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running setscene task 718 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1368 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1399 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1401 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 720 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe gnutls-3.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_unpack)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1625 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1815 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2060 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: Running task 2061 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_lic unihash changed to e1bdfa684d4361f73b582e27b4979f01d79d835ed6912fe3c07093fc56048623
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_patch)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2079 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2080 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2082 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2088 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
ERROR: expat-2.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.2.10-r0 to 0:2.2.9-r0) [version-going-backwards]
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_configure)
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_compile)
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_install)
NOTE: recipe gnutls-3.6.14-r0: task do_install: Started
NOTE: recipe gnutls-3.6.14-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package)
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata)
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============4663418285373095825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 528064 to 531920 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 5445 to 5623 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGSIZE changed from 5349 to 5414 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 5298 to 5505 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 4651 to 4831 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 5100 to 5175 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 4805 to 4995 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 5209 to 5411 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGSIZE changed from 5120 to 5176 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 5149 to 5379 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGSIZE changed from 5104 to 5297 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 5112 to 5306 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 4761 to 4942 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 5075 to 5261 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGSIZE changed from 3744 to 3950 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 3870 to 6224 (+61%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 5232 to 5435 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 5147 to 5312 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 5308 to 5490 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGSIZE changed from 5097 to 5276 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGSIZE changed from 5397 to 5547 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGSIZE changed from 5545 to 5726 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 5431 to 5593 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGSIZE changed from 6797 to 7006 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 4970 to 5126 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 4661 to 4847 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 7137 to 9938 (+39%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGSIZE changed from 4304 to 4464 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 228757 to 236949 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 423860 to 427367 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.64.3" to "2.66.0"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.64.3 [default] to 2.66.0 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.64.3" to "2.66.0"

--===============4663418285373095825==--
