Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1329.1618510599840320599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7748138C1336
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.2.1 FAILED
Message-ID: <MADEUP.16761AD15E4C0D93.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150560
Content-Type: multipart/mixed; boundary="===============0742601627437994722=="

--===============0742601627437994722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.2.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.0.3-1.2.1.patch
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

--===============0742601627437994722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fd89eea3c365778474f365fa2da85043385ee791"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 130 Local 93 Network 0 Missed 37 Current 533 (71% match, 94% complete)
Removing 14 stale sstate objects for arch ppc7400...done.
Removing 8 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 557 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: Running setscene task 564 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: Running setscene task 574 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_setscene)
NOTE: Running task 958 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_fetch)
NOTE: Running task 1149 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_write_config)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1254 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1965 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1966 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_lic)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_lic: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_lic unihash changed to 0d7f06ee4c222f6591767383a133775f780301910b21cc8417a77996d19a1fee
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2018 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2046 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_configure)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_install)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2050 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2054 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_qa)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_qa: Started
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2055 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_configure)
NOTE: recipe systemd-1_247.4-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_qa: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_compile)
NOTE: recipe systemd-1_247.4-r0: task do_compile: Started
NOTE: recipe systemd-1_247.4-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_install)
NOTE: recipe systemd-1_247.4-r0: task do_install: Started
NOTE: recipe systemd-1_247.4-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2060 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2064 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2065 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to 51f707ce0ae0369f82a41d53739ffcc760a0ce51cb4114a55afb645a7a1de463
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Running setscene task 671 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running task 2069 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2071 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2072 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2073 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to d695a669d363a77ad9498a7012d942e765371c1cebfb4079a6af3e7dfedddee9
NOTE: Setscene tasks completed
NOTE: Running task 2074 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2075 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 7078d166d3ccd9dc04fa5bfefb625b8c10d84c2941ab43f31c1dbe3d21d7c574
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm became valid
NOTE: Running setscene task 690 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 691 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running task 2077 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm unihash changed to 87467dc53173037167c1224f374643912dc9b29d2880afe16d6b47c4f98627e6
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2080 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm unihash changed to 41662792ed027bd2a4fd5a62b114d7ce61fcfcd58c13aa64f1f9071b212521dd
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2082 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2083 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2084 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2085 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2086 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 555bf89c29dce036a70f5be15a0d4160552b358cafe77768c5e99d35b6987c81
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2088 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2089 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2091 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2093 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot)
NOTE: Running task 2094 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot unihash changed to fd9e90bc649bfc013c4c8e08a34357f6b419e4e06db98c8387cca6d1333a272d
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2097 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: Running task 2102 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata unihash changed to db9b24b77cde19bbd78ca9dfd90ed576222bdb6ee5243255bd215f146579a1bf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm became valid
NOTE: Running setscene task 726 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: Running setscene task 727 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running task 2106 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 728 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass', lineno: 322, function: buildhistory_emit_pkghistory
     0318:
     0319:        write_pkghistory(pkginfo, d)
     0320:
     0321:    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
 *** 0322:    bb.build.exec_func("buildhistory_list_pkg_files", d)
     0323:}
     0324:
     0325:python buildhistory_emit_outputsigs() {
     0326:    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 256, function: exec_func
     0252:    with bb.utils.fileslocked(lockfiles):
     0253:        if ispython:
     0254:            exec_func_python(func, d, runfile, cwd=adir)
     0255:        else:
 *** 0256:            exec_func_shell(func, d, runfile, cwd=adir)
     0257:
     0258:    try:
     0259:        curcwd = os.getcwd()
     0260:    except:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 503, function: exec_func_shell
     0499:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0500:        try:
     0501:            bb.debug(2, "Executing shell function %s" % func)
     0502:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0503:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0504:        except bb.process.ExecutionError as exe:
     0505:            # Find the backtrace that the shell trap generated
     0506:            backtrace_marker_regex = re.compile(r"WARNING: Backtrace \(BB generated script\)")
     0507:            stdout_lines = (exe.stdout or "").split("\n")
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/process.py', lineno: 184, function: run
     0180:        if not stderr is None:
     0181:            stderr = stderr.decode("utf-8")
     0182:
     0183:    if pipe.returncode != 0:
 *** 0184:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0185:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484' failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484: line 170: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/packages-split/shared-mime-info-locale-ka: No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484:167 exit 1 from 'buildhistory_list_files $pkgdir $outfile fakeroot'
WARNING: Backtrace (BB generated script): 
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484, line 167
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484, line 162
	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/run.buildhistory_list_pkg_files.148484, line 211

Backtrace (metadata-relative locations):
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 548
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 585

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.148484
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2107 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2109 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 03ab1fb9061562f8fb5c31369b03d502cd5a39cbe5377451909f2b97208f0558
NOTE: Setscene tasks completed
NOTE: Running task 2110 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to dc54f9bc56d18f9768d80c0a7c0c62a740ceccc82015138368d0a3035e64fbbb
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2114 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2115 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2116 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2118 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2119 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to cacffe8ff772413fde5efa98dc0c42c1cbe3ce29f7d6d2803338e23077817816
NOTE: Setscene tasks completed
NOTE: Running task 2120 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2121 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm unihash changed to 2640ce6f73dbfab96ab0c6fcae3af246f8069318458b9180751e7cc1172dcd97
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to 3a55032b1054c1a91e55df87d5dc7abc3273c84ab93cc93b607341665880c675
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to a8e4d98b569060941dd89bda33695d7867b321064ed22e7ce9de50dbb399b43d
NOTE: Running noexec task 2122 of 2122 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2122 tasks of which 2047 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============0742601627437994722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.0.3-1.2.1.patch"

From e4672b62732a2612c9f7705dea7b4046132045b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 14:35:39 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.0.3 -> 1.2.1

---
 .../xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.2.1.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
index 99f55f4a14..3df90f7c3e 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a2202f851e072b84e64a395212cbd976ee18a8ee602008b0bad02a13247dbc52"
+SRC_URI[sha256sum] = "e833a7d3024c9bb9d5eb2b20f6d5de08865541f21bb7ba227c83cbd236691fb3"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.27.0


--===============0742601627437994722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxkbcommon: SRC_URI changed from "http://xkbcommon.org/download/libxkbcommon-1.0.3.tar.xz" to "http://xkbcommon.org/download/libxkbcommon-1.2.1.tar.xz"
packages/core2-32-poky-linux/libxkbcommon: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 923024 to 928692 (+1%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 311263 to 330460 (+6%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 6082 to 6147 (+1%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1348341 to 1391990 (+3%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.0.3" to "1.2.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.0.3 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 430010 to 438202 (+2%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.0.3" to "1.2.1"

--===============0742601627437994722==--
