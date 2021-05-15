Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4497.1621074783901288369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3A31838C13A2
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rng-tools: upgrading to 6.12 SUCCEEDED
Message-ID: <MADEUP.167F36EDFE972FD8.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151852
Content-Type: multipart/mixed; boundary="===============1491013870431766199=="

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rng-tools* to *6.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rng-tools-upgrade-6.11-6.12.patch
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

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: RRECOMMENDS: removed "libsysfs-dbg"
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: RRECOMMENDS: removed "libsysfs-dev"
packages/core2-32-poky-linux/rng-tools/rng-tools: RDEPENDS: removed all items "libsysfs (['>= 2.1.0'])"

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-6597ef3cbd27e7cfe1765e58068549a480b41428"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6597ef3cbd27e7cfe1765e58068549a480b41428"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 26 Network 0 Missed 21 Current 688 (55% match, 97% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 710 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 713 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: Running task 1144 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 1549 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1627 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_fetch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1848 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1849 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Started
NOTE: Running task 1866 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1867 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 1954 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 2156 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_patch)
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-src went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dbg went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package dumpsexp-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-staticdev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-doc went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-locale went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 735 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2159 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_patch: Succeeded
NOTE: Running task 2160 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2183 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Started
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2209 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2210 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic unihash changed to 4fcede09b2cb6b2b2a362b19b0b7ebbefd1ca7b65e1d5718a312091622aa4a33
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: Running task 2213 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2216 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2258 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2285 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2288 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2290 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2291 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2292 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2293 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2294 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_configure)
NOTE: recipe rng-tools-6.12-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2296 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_install)
NOTE: recipe rng-tools-6.12-r0: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package)
NOTE: Running task 2301 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_package: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_packagedata)
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_qa)
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2305 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_build)
NOTE: Tasks Summary: Attempted 2305 tasks of which 2261 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6597ef3cbd27e7cfe1765e58068549a480b41428"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6597ef3cbd27e7cfe1765e58068549a480b41428"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 25 Network 0 Missed 21 Current 689 (54% match, 97% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 710 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 713 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 1144 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1553 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1554 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1631 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_fetch)
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-src went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dbg went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package dumpsexp-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-staticdev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-doc went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-locale went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1822 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1823 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Started
NOTE: Running task 1848 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1849 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_unpack)
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 2156 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2204 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.12-r0: task do_patch: Succeeded
NOTE: Running task 2206 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2208 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2209 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2210 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic unihash changed to 4fcede09b2cb6b2b2a362b19b0b7ebbefd1ca7b65e1d5718a312091622aa4a33
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2213 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2216 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2258 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2288 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2290 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2291 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2292 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2293 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2294 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_configure)
NOTE: recipe rng-tools-6.12-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2296 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_install)
NOTE: recipe rng-tools-6.12-r0: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package)
NOTE: Running task 2301 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_package: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_packagedata)
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_qa)
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2305 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_build)
NOTE: Tasks Summary: Attempted 2305 tasks of which 2261 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1491013870431766199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-rng-tools-upgrade-6.11-6.12.patch"

From bc7bc099efa251c62cb554f3c13201dbef4bbfe7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 10:13:21 +0000
Subject: [PATCH] rng-tools: upgrade 6.11 -> 6.12

---
 .../rng-tools/{rng-tools_6.11.bb => rng-tools_6.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.11.bb => rng-tools_6.12.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.11.bb b/meta/recipes-support/rng-tools/rng-tools_6.12.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.11.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.12.bb
index 61a0cef2e0..9673700981 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.11.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "2ea13473fd5bfea3c861dc0e23bd65e2afe8007b"
+SRCREV = "a2cd12bc253a014328b87137559fd4e1ab296d9b"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 106 recipes from the core2-32 sysroot...done.
Removing 110 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-6597ef3cbd27e7cfe1765e58068549a480b41428"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6597ef3cbd27e7cfe1765e58068549a480b41428"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 551 Local 529 Network 0 Missed 22 Current 195 (96% match, 97% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 255 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 256 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 258 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 261 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 268 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 282 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 291 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 322 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 336 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 337 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 355 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 356 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 359 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 367 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 381 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 384 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 400 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 710 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 711 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 730 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_fetch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: Running task 957 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 962 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 997 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 998 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: Running setscene task 441 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1007 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1021 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1030 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 466 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1035 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic)
NOTE: Running setscene task 469 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 471 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 1040 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-src went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dbg went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package dumpsexp-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-staticdev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-doc went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-locale went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic unihash changed to 4fcede09b2cb6b2b2a362b19b0b7ebbefd1ca7b65e1d5718a312091622aa4a33
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 486 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1116 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1117 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1118 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1162 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 588 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1173 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1182 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 624 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1221 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1279 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1312 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e26bb56718bc9073a8415f8e3429c9bc0634b7262f81b3677d8b04efe3b0e42e
NOTE: Running task 1321 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1991 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1992 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2303 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2304 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2305 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2308 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2309 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2311 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2312 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2313 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2314 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2315 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_configure)
NOTE: recipe rng-tools-6.12-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2317 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2318 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_install)
NOTE: recipe rng-tools-6.12-r0: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package)
NOTE: Running task 2322 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_package: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package: Succeeded
NOTE: Running task 2323 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_packagedata)
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2324 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_qa)
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2326 of 2326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_build)
NOTE: Tasks Summary: Attempted 2326 tasks of which 2277 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6597ef3cbd27e7cfe1765e58068549a480b41428"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6597ef3cbd27e7cfe1765e58068549a480b41428"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 28 Network 0 Missed 21 Current 686 (57% match, 97% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 710 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 713 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1144 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 1549 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1627 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_fetch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1875 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1876 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1877 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1878 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Started
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 1970 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_unpack)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: Running setscene task 732 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 2156 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2157 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-src went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dbg went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package dumpsexp-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-staticdev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-doc went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: Running task 2159 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-locale went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_patch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2160 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic)
NOTE: Running task 2162 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 2163 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: Running task 2185 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic unihash changed to 4fcede09b2cb6b2b2a362b19b0b7ebbefd1ca7b65e1d5718a312091622aa4a33
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2213 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2216 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2258 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2288 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2290 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2291 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2292 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2293 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2294 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_configure)
NOTE: recipe rng-tools-6.12-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2296 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_install)
NOTE: recipe rng-tools-6.12-r0: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package)
NOTE: Running task 2301 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_package: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_packagedata)
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_qa)
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2305 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_build)
NOTE: Tasks Summary: Attempted 2305 tasks of which 2261 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6597ef3cbd27e7cfe1765e58068549a480b41428"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6597ef3cbd27e7cfe1765e58068549a480b41428"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 27 Network 0 Missed 21 Current 687 (56% match, 97% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 710 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 713 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: Running task 1144 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 1549 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_fetch)
NOTE: Running task 1550 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 1627 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_fetch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1901 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1902 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Started
NOTE: Running task 1903 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_unpack)
NOTE: Running task 1904 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 1989 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 732 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 2156 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rng-tools-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_patch)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-src went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dbg went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package dumpsexp-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libjitterentropy-3.0.2-r0: task do_patch: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-staticdev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: Running task 2159 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_deploy_source_date_epoch)
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-dev went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-doc went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt-locale went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
ERROR: libgcrypt-1.9.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgcrypt went backwards which would break package feeds (from 0:1.9.3-r0 to 0:1.9.2-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 735 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rng-tools-6.12-r0: task do_patch: Succeeded
NOTE: Running task 2160 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: Running task 2162 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2163 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_configure)
NOTE: Running task 2164 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_compile)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Started
NOTE: Setscene tasks completed
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_lic unihash changed to 4fcede09b2cb6b2b2a362b19b0b7ebbefd1ca7b65e1d5718a312091622aa4a33
NOTE: recipe rng-tools-6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_compile: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: Running task 2212 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2213 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package)
NOTE: Running task 2216 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: recipe libjitterentropy-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2258 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 2288 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb:do_package_write_rpm)
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjitterentropy-3.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 2290 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 2291 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 2292 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 2293 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2294 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_configure)
NOTE: recipe rng-tools-6.12-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 2296 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package_write_rpm)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_compile)
NOTE: recipe rng-tools-6.12-r0: task do_compile: Started
NOTE: recipe rng-tools-6.12-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_install)
NOTE: recipe rng-tools-6.12-r0: task do_install: Started
NOTE: recipe rng-tools-6.12-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package)
NOTE: Running task 2301 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_populate_sysroot)
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Started
NOTE: recipe rng-tools-6.12-r0: task do_package: Started
NOTE: recipe rng-tools-6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_packagedata)
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_package_qa)
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Started
NOTE: recipe rng-tools-6.12-r0: task do_package_qa: Succeeded
NOTE: recipe rng-tools-6.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2305 of 2305 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.12.bb:do_build)
NOTE: Tasks Summary: Attempted 2305 tasks of which 2261 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1491013870431766199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rng-tools: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PKGSIZE changed from 170412 to 170876 (+0%)
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: RRECOMMENDS: removed "libsysfs-dbg"
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: RRECOMMENDS: removed "libsysfs-dev"
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-doc: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-doc: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-locale: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-locale: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PKGSIZE changed from 101397 to 101815 (+0%)
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools-staticdev: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-staticdev: PV changed from "6.11" to "6.12"
packages/core2-32-poky-linux/rng-tools/rng-tools: RDEPENDS: removed all items "libsysfs (['>= 2.1.0'])"
packages/core2-32-poky-linux/rng-tools/rng-tools: PKGV changed from 6.11 [default] to 6.12 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools: PV changed from "6.11" to "6.12"

--===============1491013870431766199==--
