Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.324.1615826520754776137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3D88B38C1283
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.05 SUCCEEDED
Message-ID: <MADEUP.166C91A90DFE1F07.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149501
Content-Type: multipart/mixed; boundary="===============2583005296920673885=="

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.05* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.04-0.12.05.patch
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

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.04.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.05.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5816824 to 5839508 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 51062 to 51286 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2896769 to 2910603 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.04" to "0.12.05"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.04 [default] to 0.12.05 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4139304 to 4143464 (+0%)

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-6a855e2c5a84c839f1e4965290ac9fd27358e53d"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6a855e2c5a84c839f1e4965290ac9fd27358e53d"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 19 Network 0 Missed 11 Current 640 (63% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 657 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1101 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1516 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_fetch)
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Succeeded
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1915 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_unpack)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1916 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_prepare_recipe_sysroot)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_patch)
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_deploy_source_date_epoch)
NOTE: Running task 2061 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2062 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Succeeded
NOTE: Running task 2064 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic unihash changed to 3f44c479871cf439f21150b9e9b2a1780cd9e615cae5fa4dd7d3f4220b29770a
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_compile)
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: Running task 2134 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_install)
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-6a855e2c5a84c839f1e4965290ac9fd27358e53d"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6a855e2c5a84c839f1e4965290ac9fd27358e53d"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 19 Network 0 Missed 11 Current 640 (63% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 657 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1101 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1516 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_fetch)
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Succeeded
NOTE: Running task 1878 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_unpack)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1879 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_prepare_recipe_sysroot)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_deploy_source_date_epoch)
NOTE: Running task 2061 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2062 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic unihash changed to 3f44c479871cf439f21150b9e9b2a1780cd9e615cae5fa4dd7d3f4220b29770a
NOTE: Running task 2064 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_configure)
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2065 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66af55b123d9f9dcf0b8b6ec352551d2c5d1af62fbd17812dafc6110128e1f05
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to df6a43dc8818d0947bc0f54fdff6095a9b2ee1e477bf529fb2ae6b3ac56371fe
NOTE: Setscene tasks completed
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_install)
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-6a855e2c5a84c839f1e4965290ac9fd27358e53d"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6a855e2c5a84c839f1e4965290ac9fd27358e53d"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 18 Network 0 Missed 11 Current 641 (62% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 658 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running task 1101 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1516 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_fetch)
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_unpack)
NOTE: Running task 1892 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_patch)
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_deploy_source_date_epoch)
NOTE: Running task 2061 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2062 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic unihash changed to 3f44c479871cf439f21150b9e9b2a1780cd9e615cae5fa4dd7d3f4220b29770a
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2064 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_configure)
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3cd33b3b118bcd2d611f0ef1df7e5da16aaba995e145f3e72f84ba5240ca287f
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e214d8e722684895ce7d2e4e2646ce6ff189091d0349f92be4eca70546780a46
NOTE: Setscene tasks completed
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_install)
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2583005296920673885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-6a855e2c5a84c839f1e4965290ac9fd27358e53d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6a855e2c5a84c839f1e4965290ac9fd27358e53d"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 18 Network 0 Missed 11 Current 641 (62% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 658 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1101 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1516 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_fetch)
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_fetch: Succeeded
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1819 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_unpack)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1820 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_prepare_recipe_sysroot)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.05-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_patch)
NOTE: recipe stress-ng-0.12.05-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_deploy_source_date_epoch)
NOTE: Running task 2061 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2062 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_lic unihash changed to 3f44c479871cf439f21150b9e9b2a1780cd9e615cae5fa4dd7d3f4220b29770a
NOTE: Running task 2064 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_configure)
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_install)
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.05-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.05-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2583005296920673885==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.04-0.12.05.patch"

From 45b7a45b6a012a92ae6a7cd99f378c4f262a6616 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 07:07:27 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.04 -> 0.12.05

---
 .../stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
index 28887204d9..eb6bdb4a81 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "b4e34bda8db4ed37e33b7a861bc06ad77cbbd234d63236da2cb58f02e3f3218e"
+SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


--===============2583005296920673885==--
