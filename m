Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.13044.1626600382488889474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id B919838C139E
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.20 FAILED
Message-ID: <MADEUP.1692D86E114271F9.27710@lists.openembedded.org>
X-Groupsio-MsgNum: 153975
Content-Type: multipart/mixed; boundary="===============7057539732930918390=="

--===============7057539732930918390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdbm* to *1.20* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gdbm-upgrade-1.19-1.20.patch
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

--===============7057539732930918390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-bin: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-compat: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 801880 to 859532 (+7%)
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 14270 to 14680 (+3%)
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-doc: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 179576 to 187167 (+4%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 14387 to 14022 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 16763 to 18206 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 16039 to 17436 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 14847 to 14486 (-2%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 12299 to 11953 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 17153 to 18703 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 6164 to 5762 (-7%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 16737 to 18088 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 16594 to 18079 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 21254 to 22974 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 21057 to 22827 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 16096 to 17439 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 21800 to 23644 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 18101 to 17383 (-4%)
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 325415 to 325414 (-0%)
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-src: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 397009 to 419951 (+6%)
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)
packages/core2-32-poky-linux/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz file://run-ptest file://ptest.patch"
packages/core2-32-poky-linux/perl/perl-dbg: PKGSIZE changed from 16787764 to 16789892 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 15028224 to 15029372 (+0%)

--===============7057539732930918390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 52 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-a3482b7f0f28304ad81fed2a241248b2e6070c03"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a3482b7f0f28304ad81fed2a241248b2e6070c03"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 5 Network 0 Missed 150 Current 598 (3% match, 80% complete)
Removing 104 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 38 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 563 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_fetch)
NOTE: Running task 970 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_fetch: Started
NOTE: recipe gdbm-1.20-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_unpack)
NOTE: Running task 1042 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1088 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gdbm-1.20-r0: task do_unpack: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_patch)
NOTE: Running task 1199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1209 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_patch: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_patch: Succeeded
NOTE: Running task 1751 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2075 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic)
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2076 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure)
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdbm-1.20-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic unihash changed to 673c8d4979d82e60932bb0b2d09bc84eaaa7447ace02394e1e610069c8f9bd76
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2078 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: Running task 2079 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2081 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2082 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2083 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2a3512e34bb8c88292f266a4cf8ceac3ca881fc19e8d9bdd9a831abf7b881d9d
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_compile)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2086 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 69003abec21630d75e8d49ace4cba7ec76fcc8f9328d483319f958abafff2414
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Succeeded
NOTE: Running task 2088 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot)
NOTE: Running task 2089 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot unihash changed to 7df15c4ce3669dbb31ad33bc78b3c3eebdae9359a5973d4be7be56cc577ca60b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 794 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Succeeded
NOTE: Running task 2092 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata unihash changed to 9456328b31a8633b19f027ac17e4bbe9d977ba1d0b1bd33091e06e76a0e0da8c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Running setscene task 855 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_setscene)
NOTE: Running setscene task 856 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 857 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_setscene)
NOTE: Running setscene task 858 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 859 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 862 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 865 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_setscene)
NOTE: Running setscene task 866 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2113 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 2114 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 2115 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 888 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 889 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot unihash changed to 576c9a71c93e3b88cd5accca140e7e9c1bd6e934cb97a4def283b301a828f73c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot became valid
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Succeeded
NOTE: Running setscene task 944 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2116 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 2117 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm unihash changed to d32deb97e91ae849fbc905b6eaaaa1c5c1eb3a2a27e46c94259401c2f40565ea
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 948 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 6926f14a6d797fd2c33a3a58ff029020e418aee47f9d7a50f63608bd987e3ec5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Running setscene task 975 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 976 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 977 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running task 2136 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 996 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm unihash changed to 880c8268981d992b7905b407f530de8c3fa3cf429f9af5ee96b387429a5f1afe
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Succeeded
NOTE: Running task 2142 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot)
NOTE: Running task 2143 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Started
ERROR: libxcb-1.14-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass', lineno: 323, function: buildhistory_emit_pkghistory
     0319:
     0320:        write_pkghistory(pkginfo, d)
     0321:
     0322:    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
 *** 0323:    bb.build.exec_func("buildhistory_list_pkg_files", d)
     0324:}
     0325:
     0326:python buildhistory_emit_outputsigs() {
     0327:    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
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
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824' failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824: line 195: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/packages-split/libxcb-staticdev: No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824:192 exit 1 from 'buildhistory_list_files $pkgdir $outfile fakeroot'
WARNING: Backtrace (BB generated script): 
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824, line 192
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824, line 165
	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.1921824, line 214

Backtrace (metadata-relative locations):
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 549
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 586

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/log.do_packagedata_setscene.1921824
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Running task 2145 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot unihash changed to 2f5ee1679565bfd25bdae52b6026d27e69edb2a65299a96ee44719420e3fe8fe
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.20-r0: task do_configure: Succeeded
NOTE: Running task 2151 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2152 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile)
NOTE: recipe gdbm-1.20-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata unihash changed to 27cc6a6d81755d3902ea4ca20abe99aab04873e9907b25da480a5f8553cb0840
NOTE: Setscene tasks completed
NOTE: Running task 2153 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_compile: Succeeded
NOTE: Running task 2154 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm unihash changed to acf2e1ee7f7d6b71f461847eb4e15859c9f0a0cb10426f420e99a52686e40e32
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot)
NOTE: Running task 2158 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot unihash changed to 98c1fe378ec245066f87fcaadd5c68a15743256045c876b526c7aaa0b3fe3bf5
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2159 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install)
NOTE: recipe gdbm-1.20-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.20-r0: task do_install: Succeeded
NOTE: Running task 2161 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install_ptest_base)
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to cad5b13defea93fc5f82940679b6f8439b1de28ab1259d10c644d969e8f8e793
NOTE: Setscene tasks completed
NOTE: Running task 2162 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2163 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_sysroot)
NOTE: Running task 2164 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package)
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2165 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2166 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm unihash changed to b763e0896baceea30b3ba8100771e6feb3fdbf929324cf66bf806440e6eeb06d
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2167 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_packagedata)
NOTE: recipe python3-3.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2169 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_configure)
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.6-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Succeeded
NOTE: Running task 2170 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_write_rpm)
NOTE: Running task 2171 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_qa)
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_compile)
NOTE: recipe libidn2-2.3.1-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_install)
NOTE: recipe libidn2-2.3.1-r0: task do_install: Started
NOTE: recipe libidn2-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package)
NOTE: recipe libidn2-2.3.1-r0: task do_package: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot unihash changed to 10f04ca952e3d5d38763ce3b94c52237db63ac4a8b7957334d5daedc4c1892bd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1202 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2176 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2183 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata unihash changed to 73f2ea16043bd78b36bd04f79340f0a29b28cd53ca7eea4580e0d964defa94c2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata became valid
NOTE: Running setscene task 1216 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2184 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1222 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm unihash changed to 39847a787e67eeb014b86aeb37f7c069015dc9774801ecaa7704d335d0771a0f
NOTE: recipe python3-3.9.6-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_configure_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2189 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_compile)
NOTE: recipe python3-3.9.6-r0: task do_compile: Started
NOTE: recipe perl-5.34.0-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2191 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile)
NOTE: recipe perl-5.34.0-r0: task do_compile: Started
NOTE: recipe python3-3.9.6-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2193 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_install)
NOTE: recipe python3-3.9.6-r0: task do_install: Started
NOTE: recipe perl-5.34.0-r0: task do_compile: Succeeded
NOTE: Running task 2194 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2195 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install)
NOTE: recipe perl-5.34.0-r0: task do_install: Started
NOTE: recipe gnutls-3.7.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2196 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_compile)
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Started
NOTE: recipe python3-3.9.6-r0: task do_install: Succeeded
NOTE: Running task 2197 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_install_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2198 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot)
NOTE: Running task 2199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package)
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.9.6-r0: task do_package: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure)
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_install)
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2204 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.2-r0: task do_install: Started
NOTE: recipe perl-5.34.0-r0: task do_install: Succeeded
NOTE: Running task 2205 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_package: Succeeded
NOTE: Running task 2206 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata)
NOTE: recipe python3-3.9.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot)
NOTE: Running task 2208 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot unihash changed to c97191575474bae8cae5adf3d5f4f2820285859a78b7a0bca6ed7f5208ae092b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1236 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2209 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2227 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm unihash changed to bcf5d04a5f029fd5671f675ffad16400a1ba87fc0a51cd62329fe27ff77f4e53
NOTE: recipe gnutls-3.7.2-r0: task do_package: Succeeded
NOTE: Running task 2228 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata unihash changed to bdd24635f3631e510f3fb913cd7e004146648544320ae0dcb7eee15d320eda3d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb:do_package became valid
NOTE: Running setscene task 1241 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1244 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1249 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running task 2229 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1250 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Succeeded
NOTE: Running setscene task 1254 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: Running task 2230 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile_ptest_base)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm unihash changed to 41961f88b173c1fcb3d109f9c384cebe0c621620ad71118e674eccd244560ecb
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2240 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package)
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot unihash changed to 59a43adee4731f94e854ac5ddf460ea8b14783f1e31e5e1afc4896b922cb1a36
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_install)
NOTE: recipe libxml2-2.9.12-r0: task do_install: Started
NOTE: recipe libxml2-2.9.12-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2252 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot)
NOTE: Running task 2253 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot unihash changed to 0a64125fb9b1cd699441c4a0523753e89ee31107ff68a1fbb0346cdea18e98a3
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2257 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: recipe wayland-1.19.0-r0: task do_compile: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2259 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2261 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to f2202eb505697efd0ccecc270b966c10535e5d0eef4d0a90f21dca839b4fb7fe
NOTE: Setscene tasks completed
NOTE: Running task 2262 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2263 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2264 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2266 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot unihash changed to 6ecab7c5d009ff98193c70f59e6e120b8e680eb6906bfa2385e605e54a922cea
NOTE: Setscene tasks completed
NOTE: Running task 2267 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2268 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Succeeded
NOTE: Running task 2269 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata unihash changed to 40b437ad7d5bdb21faf527e51846b97e0be9f00e877d82c4324544362a97e6fe
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2271 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Succeeded
NOTE: Running task 2273 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 3fede0c6d98ffcc77997fa53cefd886851cdb577677677f671452c12de20bbe6
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package)
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2275 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata unihash changed to 6e8ffb38b900955009ea1bec932ee67a7de8736c768dddd0b24fbcb87bc2ad6f
NOTE: Setscene tasks completed
NOTE: Running task 2276 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm unihash changed to 6baf1246ffe7d844e172d548fb1266ba1f3a20697f13fd956166b1799db61b65
NOTE: recipe systemd-1_248.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2277 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_compile)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm unihash changed to 3cfd740c368738cd446642b039dc0190e0acc822e39a444073ae8fd19de666ce
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2278 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2279 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2280 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm)
NOTE: Running task 2281 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2282 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2283 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm)
NOTE: Running task 2284 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm)
NOTE: Running task 2285 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_install)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm unihash changed to 3fa27d2053f8ff92c74b927716ddd7626f32c64f8c0225a1a772a99ed3defccf
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 2187c9b11a81406365cec60b8bc80b661dbe0841aed8fb684a65e0c509847138
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to a44db07fd77f04dfbc4fcea2c44b156e7daecc3cf40bd621ae3687bb4c271643
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to c9c2ad82e382c23264cb30aec0cdd2a12111e9625553adfc2d71f6d94e21d1a3
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm unihash changed to 7d02cda38aa4152ed6a3b011ead21c28a75c68be07a655aea1e17dec71c0e92d
NOTE: recipe systemd-1_248.3-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm unihash changed to 626106c4fcf1fe5ea0a2d6d5abbab9547b38253356582be30920b6dccb35c5bd
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2292 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2293 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2294 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm unihash changed to b1b9e6cd31533c158dd1eba8585fd30fd20f831e4e87498a3a8eebf598772baa
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2301 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: Running task 2302 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm unihash changed to ba47dd24fb0824548d4cc0d02df8793f04de681dfca68372682000eefed0b29c
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata unihash changed to b35604de4c710adcb7b05472724179815239e193a4decc61f9fcce6c3dcb9fde
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm unihash changed to 22901ef85c62689117a70c5aa5b4804295622e39456736b082d29e22fc923dbc
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm unihash changed to d32762584235088984fdae81d619923a8a8df9d56505ef67d71c33d9c16ba19c
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm unihash changed to 01fac3340d17644bdb01220075548e2568edd682e28e866d5edf0ba4b215a5d6
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to f353d6f78c0cb2142f0c47407a0c326b65f8de20a666120730a5a9b8b84b19f0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1541 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm unihash changed to a065b56690102b6482a2ae9486fdc977e034be1f96441409bfae5fadb13b29a0
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm unihash changed to d53a4a7b3669047290beaf9e9dd92c0f6c504adcf757e8b3ee19e081bfbf5c52
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 929c9233a84387a3cc67b677b2dd932409893e664d3132ec2803f1d5626094f0
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm unihash changed to 5f310167a343c9e72eb880b9168619231a0674474f5c05db0619bec4bf383f47
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2320 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2321 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2323 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2325 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to f27811d79cb2e16ba451e7ff24450d253a14b73368c7456e64f7f31d807157e5
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 129add58397887849a1bfcc56ad3ff1a07723314344d3cf9e6e3b0746f5f2241
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm unihash changed to a19acfa8461a3bd02c900e6bf9275921654409bee7b860efdd4cf41580b8d648
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot unihash changed to 1b6163d5347d202182222c54cc694bf59d861adddd87b1983b49abe1dc61faf1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1610 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1611 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to 7862512d73db55a03de26da83db7a7a9b526f60888a497b79aab5e0709a1efc2
NOTE: Setscene tasks completed
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to f9aea9ffb691b85c71288a4464b9b55162606973429b2f00ca22c9c57ede82d0
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to dd7c9d9da8fb2b85e304a0c5e968962b6fcbd3754a675449df8bbc4a266183b5
NOTE: Setscene tasks completed
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 723c659ec96239950c69e97501c1f57f564f53301fa575e3ece82aa62fcb2c98
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2374 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 5c53d8fc7e5b5897dce957d48ac403817d3d9f3034b02a6ea75e6856e90ba861
NOTE: Setscene tasks completed
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2379 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm unihash changed to e27c21daeb6ae00f8bdc522166c6dd5e129c08e5eafaf14f0df11c1e0fcccaa7
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to 31da475465da3f514ad9d59ae89c5e198e335f893cdd17935bf7a47b904b3ec5
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to f263aad4109b57d9445919d81f258aae2d18912932da26135ed38275ffe9e0dc
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to 72fd335ab356ac62f9d6c1419e0956b431cb4acf23a710e3b3c198c4d99a905e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Running setscene task 1626 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1629 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to f782cbe44d69f4225cdc482273b89a088a53c363d608832a6e69328c9305974c
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2388 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to 04cfca3caf31ff3ba3ba1f42ea2101ee9792feecc3155dfca53ad2c0be575f8f
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to 8ba7e3648bde731f0ced87f01323a00e9177f1cd62d79056ba608ac2c27c483b
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2173 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7057539732930918390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)

--===============7057539732930918390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.19-1.20.patch"

From 5735e713f6769957b2d6466d19597ba1bd2cdfa6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 09:26:20 +0000
Subject: [PATCH] gdbm: upgrade 1.19 -> 1.20

---
 meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.20.bb
similarity index 90%
rename from meta/recipes-support/gdbm/gdbm_1.19.bb
rename to meta/recipes-support/gdbm/gdbm_1.20.bb
index cd2617b130..51f9d17e49 100644
--- a/meta/recipes-support/gdbm/gdbm_1.19.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
@@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
-SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
+SRC_URI[sha256sum] = "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.27.0


--===============7057539732930918390==--
