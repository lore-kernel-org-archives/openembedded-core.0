Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1363.1618510600238628654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2051B38C13DA
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.8.3 SUCCEEDED
Message-ID: <MADEUP.16761AD181B5CE40.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150574
Content-Type: multipart/mixed; boundary="===============8556248022011870780=="

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.8.0-1.8.3.patch
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

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.3 to libWPEBackend-fdo-1.0.so.1.6.6
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.3 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.6
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8f8bd5ddb647eeb980d803926bd8e28c9dee920e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 106 Network 0 Missed 7 Current 628 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 714 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 721 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1706 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_fetch)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 739 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Started
NOTE: Running task 1935 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1981 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_unpack)
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Succeeded
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_patch)
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic)
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Started
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2320 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic unihash changed to ccbc5cef5bade16540fac00b26dc9f40a017b8a25770f27701ea9ccd6e050d44
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package)
NOTE: Running task 2327 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_write_rpm)
NOTE: Running task 2330 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_qa)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2331 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2331 tasks of which 2315 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8556248022011870780==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8f8bd5ddb647eeb980d803926bd8e28c9dee920e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 105 Network 0 Missed 7 Current 629 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 715 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 722 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 739 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1706 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_fetch)
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: Running task 1935 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_write_config)
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Started
NOTE: Running setscene task 741 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1997 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Started
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2317 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2320 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2322 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic unihash changed to ccbc5cef5bade16540fac00b26dc9f40a017b8a25770f27701ea9ccd6e050d44
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package)
NOTE: Running task 2327 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_write_rpm)
NOTE: Running task 2330 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_qa)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2331 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2331 tasks of which 2315 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 169 recipes from the core2-32 sysroot...done.
Removing 174 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8f8bd5ddb647eeb980d803926bd8e28c9dee920e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 554 Local 546 Network 0 Missed 8 Current 198 (98% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 260 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 262 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 270 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 273 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 288 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 289 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 345 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 355 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 356 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 378 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 386 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 389 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 403 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: Running task 756 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_fetch)
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 870 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_write_config)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Started
NOTE: Running setscene task 438 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 981 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_unpack)
NOTE: Running setscene task 447 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Started
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1065 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic)
NOTE: recipe mesa-2_21.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic unihash changed to ccbc5cef5bade16540fac00b26dc9f40a017b8a25770f27701ea9ccd6e050d44
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 507 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 583 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 586 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 588 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 593 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 605 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 623 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 629 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 682 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2092 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2344 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package)
NOTE: Running task 2348 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2350 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_write_rpm)
NOTE: Running task 2351 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_qa)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2352 of 2352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2352 tasks of which 2336 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8f8bd5ddb647eeb980d803926bd8e28c9dee920e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 106 Network 0 Missed 7 Current 628 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 714 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 721 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1706 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_fetch)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 739 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: Running task 1935 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_unpack)
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Succeeded
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2306 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_patch)
NOTE: Running setscene task 741 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Started
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic)
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2320 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic unihash changed to ccbc5cef5bade16540fac00b26dc9f40a017b8a25770f27701ea9ccd6e050d44
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package)
NOTE: Running task 2327 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_write_rpm)
NOTE: Running task 2330 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_qa)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2331 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2331 tasks of which 2315 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8556248022011870780==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.8.0-1.8.3.patch"

From d2f2a5c28e3ed4affddca0e6887dcba799e4c22c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 16:08:53 +0000
Subject: [PATCH] wpebackend-fdo: upgrade 1.8.0 -> 1.8.3

---
 .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.3.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
index 344aa9717c..d27111a456 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
+SRC_URI[sha256sum] = "3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.27.0


--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8f8bd5ddb647eeb980d803926bd8e28c9dee920e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 105 Network 0 Missed 7 Current 629 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 715 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 722 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1706 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_fetch)
NOTE: Running task 1935 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_write_config)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 739 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2024 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_unpack)
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Started
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_write_config: Succeeded
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libwpe-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_patch)
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Started
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic)
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2320 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_lic unihash changed to ccbc5cef5bade16540fac00b26dc9f40a017b8a25770f27701ea9ccd6e050d44
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package)
NOTE: Running task 2327 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_write_rpm)
NOTE: Running task 2330 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_package_qa)
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Started
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_qa: Succeeded
NOTE: recipe wpebackend-fdo-1.8.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2331 of 2331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2331 tasks of which 2315 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8556248022011870780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.8.0.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.8.3.tar.xz"
packages/core2-32-poky-linux/wpebackend-fdo: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.3 to libWPEBackend-fdo-1.0.so.1.6.6
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.3 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.6
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1170000 to 1230812 (+5%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGSIZE changed from 35669 to 35647 (-0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 254273 to 255539 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.8.0" to "1.8.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.8.0 [default] to 1.8.3 [default]

--===============8556248022011870780==--
