Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5902.1626056248623376533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 614DF38C1241
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.17.4 SUCCEEDED
Message-ID: <MADEUP.1690E98B07D6CE63.2174@lists.openembedded.org>
X-Groupsio-MsgNum: 153740
Content-Type: multipart/mixed; boundary="===============2633483420556919823=="

--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.17.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.17.3-0.17.4.patch
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

--===============2633483420556919823==
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
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 4 Network 0 Missed 21 Current 743 (16% match, 97% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 744 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: Running task 1186 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1695 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1743 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: Running task 2044 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2045 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 2145 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2213 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2286 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2289 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2290 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic unihash changed to e5108f9fe4878ac759b3cbc3d05b50ceea97defc63777d26b514fdf749473c6d
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5aee81357375e47dc74dc1ce0f9da0415214c11d6cfe8e8cec85f100f054322d
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2359 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1ba205c5dff935439a6ba9665c1d19358d3b94d9a604c5237ddb3df6adced49e
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2410 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2414 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_compile)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_install)
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package)
NOTE: Running task 2422 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_write_rpm)
NOTE: Running task 2425 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2426 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2426 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1460 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 4 Network 0 Missed 21 Current 743 (16% match, 97% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 744 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1186 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1695 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1743 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1992 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 2133 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2176 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Started
NOTE: Running task 2286 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2290 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2292 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2293 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2294 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2295 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic unihash changed to e5108f9fe4878ac759b3cbc3d05b50ceea97defc63777d26b514fdf749473c6d
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dabf505693ad0159cbe77fbdafa5f556db7151d2c6d49eedb0615e89417b5252
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2359 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 73d88f4e8b858d1118c121c8b4f8d71ef1c1f032f356d1be99797c697f234ee2
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2414 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_compile)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_install)
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package)
NOTE: Running task 2422 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_write_rpm)
NOTE: Running task 2425 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2426 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2426 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============2633483420556919823==
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
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 4 Network 0 Missed 21 Current 743 (16% match, 97% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 744 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1186 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1695 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1743 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: Running task 2069 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2070 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2209 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_unpack)
NOTE: Running task 2220 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2286 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2290 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic unihash changed to e5108f9fe4878ac759b3cbc3d05b50ceea97defc63777d26b514fdf749473c6d
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f65cba28dda80dce1f2749d91bd589828425857f2542302d949145a6c87a2bb
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2359 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f1e9d25143136ff89df75508547a4b21e157890b8aa17cc5fc7c213b42812a51
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2414 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_compile)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package)
NOTE: Running task 2422 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_write_rpm)
NOTE: Running task 2425 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2426 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2426 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.17.3 to libcreaterepo_c.so.0.17.4
  /usr/lib/libcreaterepo_c.so.0.17.3 moved to /usr/lib/libcreaterepo_c.so.0.17.4

--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

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
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 4 Network 0 Missed 21 Current 743 (16% match, 97% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 744 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: Running task 1185 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1695 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1743 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: Running task 2014 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2015 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2150 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2286 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_patch)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2290 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: Running task 2291 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic unihash changed to e5108f9fe4878ac759b3cbc3d05b50ceea97defc63777d26b514fdf749473c6d
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c1c52421c558a99d97195d8181d7a47dd8c9fee192eda9baa2db4e82002169fa
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2359 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28ff717d10eeb38c6dd88776fdf8d650da378f92a7dd91f56cc79b1cc5c8dd0f
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2414 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_compile)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package)
NOTE: Running task 2422 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_write_rpm)
NOTE: Running task 2425 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2426 of 2426 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2426 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============2633483420556919823==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.17.3-0.17.4.patch"

From 64bbc10b0928a6a6d7121c3735e92202886168e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 19:14:18 +0000
Subject: [PATCH] createrepo-c: upgrade 0.17.3 -> 0.17.4

---
 .../{createrepo-c_0.17.3.bb => createrepo-c_0.17.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.3.bb => createrepo-c_0.17.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
index 481c4bff29..206c27c04f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8196982f0974c268898a5550d61b374bd58103e2"
+SRCREV = "cb74969736bdea86465e85feeceb895ff7a42610"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 43 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 562 Local 540 Network 0 Missed 22 Current 217 (96% match, 97% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 218 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 289 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 314 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 332 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 336 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 337 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 345 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 348 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 349 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 351 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 362 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 373 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: Running setscene task 388 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: Running setscene task 392 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: Running setscene task 395 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.13.0-r0 to 0:5.12.0-r0) [version-going-backwards]
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 420 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 784 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 799 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 821 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: Running task 1082 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Started
NOTE: recipe elfutils-0.185-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_generate_toolchain_file)
NOTE: Running task 1104 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 515 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_lic unihash changed to e5108f9fe4878ac759b3cbc3d05b50ceea97defc63777d26b514fdf749473c6d
NOTE: recipe createrepo-c-0.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 538 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 579 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1202 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: Running task 1224 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1225 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 623 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1249 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1268 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 646 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1281 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 651 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1289 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1329 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 700 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1390 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ca17797dcb58838ff90c4eb78986bc0e3463a242f2c6801bddee43de51bfe2c9
NOTE: Running task 1399 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 777 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 779 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1741 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2047 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2320 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 90d527c965ea68cb21fb129de4b81bdaefc2f7e60a656fb921a1df77119a739f
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2427 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2428 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2435 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2436 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_configure)
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_compile)
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2440 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_install)
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package)
NOTE: Running task 2443 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_write_rpm)
NOTE: Running task 2446 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2447 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2447 tasks of which 2396 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============2633483420556919823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1112924 to 1113736 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 15860 to 15894 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1176325 to 1178372 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 509106 to 513202 (+1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.17.3" to "0.17.4"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.17.3 [default] to 0.17.4 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.17.3" to "0.17.4"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.17.3 to libcreaterepo_c.so.0.17.4
  /usr/lib/libcreaterepo_c.so.0.17.3 moved to /usr/lib/libcreaterepo_c.so.0.17.4

--===============2633483420556919823==--
