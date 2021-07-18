Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13216.1626600382142043398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7280F38C12E1
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20210714-3.1 SUCCEEDED
Message-ID: <MADEUP.1692D86DF8ACF86D.32522@lists.openembedded.org>
X-Groupsio-MsgNum: 153961
Content-Type: multipart/mixed; boundary="===============0509506115481718038=="

--===============0509506115481718038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libedit* to *20210714-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20210522-3.1-20210714-3.1.patch
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

--===============0509506115481718038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20210522-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20210714-3.1.tar.gz file://stdc-predef.patch"
packages/core2-32-poky-linux/libedit: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 475744 to 477024 (+0%)
packages/core2-32-poky-linux/libedit/libedit-dbg: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-dev: PKGSIZE changed from 17570 to 17636 (+0%)
packages/core2-32-poky-linux/libedit/libedit-dev: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-dev: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dev: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-doc: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-doc: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-locale: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-locale: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-locale: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-src: PKGSIZE changed from 579826 to 580209 (+0%)
packages/core2-32-poky-linux/libedit/libedit-src: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-src: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-staticdev: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit: PV changed from "20210522-3.1" to "20210714-3.1"
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit: PKGV changed from 20210522-3.1 [default] to 20210714-3.1 [default]
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.66 to libedit.so.0.0.67
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.66 to libedit.so.0.0.67
  /usr/lib/libedit.so.0.0.66 moved to /usr/lib/libedit.so.0.0.67

--===============0509506115481718038==
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
DISTRO_VERSION       = "3.3+snapshot-9280ea638ea4102fda0ba5210dd2e96ad62409a4"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9280ea638ea4102fda0ba5210dd2e96ad62409a4"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 6 Network 0 Missed 16 Current 736 (27% match, 97% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1753 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_fetch)
NOTE: Running task 1845 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_unpack)
NOTE: Running task 2173 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2279 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2283 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2284 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2285 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic unihash changed to dc544223f0c6305d31b43b7a733aa499b5b0664b70e06d9d3f9837ca9a8580f5
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2287 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2a3512e34bb8c88292f266a4cf8ceac3ca881fc19e8d9bdd9a831abf7b881d9d
NOTE: Running task 2337 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2348 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 69003abec21630d75e8d49ace4cba7ec76fcc8f9328d483319f958abafff2414
NOTE: Setscene tasks completed
NOTE: Running task 2384 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_compile)
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_install)
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package)
NOTE: Running task 2393 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_sysroot)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_packagedata)
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_qa)
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2400 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to 4e57412fe7a301fd6824887460d4ec41574e70d1afb98c0cd8ddf06317fbba46
NOTE: Running noexec task 2401 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2401 tasks of which 2369 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============0509506115481718038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libedit/libedit-dev: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-locale: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit-staticdev: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.66", added "/usr/lib/libedit.so.0.0.67"
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.66 to libedit.so.0.0.67
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.66 to libedit.so.0.0.67
  /usr/lib/libedit.so.0.0.66 moved to /usr/lib/libedit.so.0.0.67

--===============0509506115481718038==
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
DISTRO_VERSION       = "3.3+snapshot-9280ea638ea4102fda0ba5210dd2e96ad62409a4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9280ea638ea4102fda0ba5210dd2e96ad62409a4"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 6 Network 0 Missed 16 Current 736 (27% match, 97% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1753 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_fetch)
NOTE: Running task 1844 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2137 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_unpack)
NOTE: Running task 2138 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2279 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2283 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Started
NOTE: Running task 2284 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2285 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic unihash changed to dc544223f0c6305d31b43b7a733aa499b5b0664b70e06d9d3f9837ca9a8580f5
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2287 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_configure)
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 70910aa6f5200a5576064a1a8f4bf358162b2cfea2e677eff1e3ac4e51e30845
NOTE: Running task 2337 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2348 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 531ff89e61a44056ea795b323115f489e696f558da7386c12095418e49c4082e
NOTE: Setscene tasks completed
NOTE: Running task 2384 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_compile)
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_install)
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package)
NOTE: Running task 2393 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_sysroot)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_packagedata)
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_qa)
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2400 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to c630761947540ee675d8763f437a5c5b119e1b46232d5116df609adc5b457586
NOTE: Running noexec task 2401 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2401 tasks of which 2369 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============0509506115481718038==
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
DISTRO_VERSION       = "3.3+snapshot-9280ea638ea4102fda0ba5210dd2e96ad62409a4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9280ea638ea4102fda0ba5210dd2e96ad62409a4"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 6 Network 0 Missed 16 Current 736 (27% match, 97% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1753 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_fetch)
NOTE: Running task 1844 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2108 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_unpack)
NOTE: Running task 2109 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2279 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2283 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2284 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2285 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic unihash changed to dc544223f0c6305d31b43b7a733aa499b5b0664b70e06d9d3f9837ca9a8580f5
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2287 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 994964385f6ac588debff6649b2bcee96d470267242d45df0b9a617d8aa01f86
NOTE: Running task 2337 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2348 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d505b3a40ada80a814d775ee23d14cf06a96c4aededb01057d9908a933216865
NOTE: Setscene tasks completed
NOTE: Running task 2384 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_compile)
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_install)
NOTE: Running task 2391 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package)
NOTE: Running task 2393 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_sysroot)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_packagedata)
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_qa)
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2400 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to 399872ce4583450037d757a798cdea2c433520702db2bc744c14ec953a6f6d11
NOTE: Running noexec task 2401 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2401 tasks of which 2369 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============0509506115481718038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20210522-3.1-20210714-3.1.patch"

From c4d965bd04fccd7fe23beb6f62c759adb2a65e2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 07:30:30 +0000
Subject: [PATCH] libedit: upgrade 20210522-3.1 -> 20210714-3.1

---
 .../{libedit_20210522-3.1.bb => libedit_20210714-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210522-3.1.bb => libedit_20210714-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
index 43e6f2244b..137676ab29 100644
--- a/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "0220bc2047e927c0c1984ef5f7b4eb2a9469a5b7bf12ba573ca3b23ca02bbb6f"
+SRC_URI[sha256sum] = "3023b498ad593fd7745ae3b20abad546de506b67b8fbb5579637ca69ab82dbc9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.27.0


--===============0509506115481718038==
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
DISTRO_VERSION       = "3.3+snapshot-9280ea638ea4102fda0ba5210dd2e96ad62409a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9280ea638ea4102fda0ba5210dd2e96ad62409a4"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 6 Network 0 Missed 16 Current 736 (27% match, 97% complete)
Removing 1 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1753 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_fetch)
NOTE: Running task 1844 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2123 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_unpack)
NOTE: Running task 2124 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_patch)
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2280 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_patch: Succeeded
NOTE: Running task 2281 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2282 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2283 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2284 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2285 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_lic unihash changed to dc544223f0c6305d31b43b7a733aa499b5b0664b70e06d9d3f9837ca9a8580f5
NOTE: recipe libedit-20210714-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2286 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2287 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8575f60d419eabdaaae3a37e8422c8caedda7884d40ee20858a504b96e1e4fe6
NOTE: Running task 2337 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2348 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3fccbe62c8e32893a85996d541fa163f3964128b381f8be7d99c1760acce381e
NOTE: Setscene tasks completed
NOTE: Running task 2384 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_compile)
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package)
NOTE: Running task 2393 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_populate_sysroot)
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_packagedata)
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_package_qa)
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Started
NOTE: recipe libedit-20210714-3.1-r0: task do_package_qa: Succeeded
NOTE: recipe libedit-20210714-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.12.1-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.13-r0 to 0:5.12.1-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2400 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm unihash changed to e5a06c44a5fb1e83dd802b9d7fd7ad80b8661bea4d83574293a24f79ded8aac7
NOTE: Running noexec task 2401 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2401 tasks of which 2369 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============0509506115481718038==--
