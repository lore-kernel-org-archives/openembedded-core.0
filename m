Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6611A38C13A4
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.16.1.3 SUCCEEDED
Message-ID: <MADEUP.16761AD106F90EFB.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150527
Content-Type: multipart/mixed; boundary="===============4180759231048520356=="

--===============4180759231048520356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.16.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpm-upgrade-4.16.1.2-4.16.1.3.patch
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

--===============4180759231048520356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/rpm (sysroot):
  /usr/lib/librpmbuild.so.9 changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmbuild.so changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9 changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmio.so changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9 changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpmsign.so changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpm.so.9 changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpm.so changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpmbuild.so.9.1.2 moved to /usr/lib/librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9.1.2 moved to /usr/lib/librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9.1.2 moved to /usr/lib/librpmsign.so.9.1.3
  /usr/lib/librpm.so.9.1.2 moved to /usr/lib/librpm.so.9.1.3
  /usr/lib/rpm/rpmpopt-4.16.1.2 moved to /usr/lib/rpm/rpmpopt-4.16.1.3
Changes to packages/x86_64-linux/rpm-native (sysroot):
  /usr/lib/librpmbuild.so.9 changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmbuild.so changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9 changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmio.so changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9 changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpmsign.so changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpm.so.9 changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpm.so changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpmbuild.so.9.1.2 moved to /usr/lib/librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9.1.2 moved to /usr/lib/librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9.1.2 moved to /usr/lib/librpmsign.so.9.1.3
  /usr/lib/librpm.so.9.1.2 moved to /usr/lib/librpm.so.9.1.3
  /usr/lib/rpm/rpmpopt-4.16.1.2 moved to /usr/lib/rpm/rpmpopt-4.16.1.3

--===============4180759231048520356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:54431528748b0dbe84617a558403c4bfc52e6523"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 310 Local 5 Network 0 Missed 305 Current 378 (1% match, 55% complete)
Removing 180 stale sstate objects for arch core2-64...done.
Removing 109 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 452 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_stash_locale_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 237 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_fetch)
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_configure)
NOTE: Running noexec task 996 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_compile)
NOTE: Running task 997 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_install)
NOTE: Running task 1002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_unpack)
NOTE: Running task 1023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_fetch)
NOTE: Running task 1054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1262 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: Running task 1263 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: Running task 1309 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1315 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1316 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic unihash changed to 777e4cd387d5e4bda3d55a8ce4020b5bc41fab7d890f9993bf1189d0944351f7
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1317 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1318 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: Running task 1319 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata unihash changed to b9632eb00967d5cff9160c8058b89e94e07ea2c816a63669d6c862e39f1ca767
NOTE: Running task 1320 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d78efa9d5d5920086310857ff871bdb1ce74968117e80456fc85a4dd8fdd6925
NOTE: Running task 1321 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata unihash changed to a8e80854e9ff7771fd74d3c722f7c44e97b93007b3486954c7e589c93c9d7164
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Succeeded
NOTE: Running task 1336 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1337 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package)
NOTE: Running task 1349 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1352 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1353 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_configure)
NOTE: recipe glibc-2.33-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to a870393e86ebb475f96ac6b727cc79fbd5e6f906b8e95b75e884a83ca4622729
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Succeeded
NOTE: Running task 1354 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata unihash changed to d2baa9db3aec0f90ce7667d9afd30b5b9976edd4a5abdb03214c6d01b9a6f486
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-2.33-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_compile)
NOTE: recipe glibc-2.33-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Succeeded
NOTE: Running task 1357 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata unihash changed to 92f9d9609fce381290dc92a82b8dc5fd77120262bcae0bbbfe1774821e9aa548
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy became valid
NOTE: Running setscene task 980 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running task 1358 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_install)
NOTE: recipe glibc-2.33-r0: task do_install: Started
NOTE: recipe glibc-2.33-r0: task do_install: Succeeded
NOTE: Running task 1517 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package)
NOTE: Running task 1684 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1752 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Started
NOTE: recipe glibc-2.33-r0: task do_package: Succeeded
NOTE: Running task 1872 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata)
NOTE: recipe glibc-2.33-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata unihash changed to 2a75194c2064ae4b4a213d6f82d3e130f4282420f0a6d0d6a86273ddc29e4eaf
NOTE: Setscene tasks completed
NOTE: Running task 1874 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package)
NOTE: Running task 1875 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package)
NOTE: Running task 1876 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1877 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure_ptest_base)
NOTE: recipe glibc-locale-2.33-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1878 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata unihash changed to dd5a526470ab8ce958aa6c2ef5bfdc2d37cc596064731aea8cd4d7665ec91fa9
NOTE: Setscene tasks completed
NOTE: Running task 1883 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package)
NOTE: Running task 1884 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1885 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata unihash changed to b0d5728008f190b1186dcfa9979be58fa83886f40a92ba52565b1ef4d9deae1e
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: Running task 1888 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: Running task 1889 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package)
NOTE: Running task 1890 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1891 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1892 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: Running task 1893 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 1894 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package)
NOTE: Running task 1895 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package)
NOTE: Running task 1896 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package)
NOTE: Running task 1897 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: Running task 1898 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package)
NOTE: Running task 1899 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1900 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1901 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: Running task 1902 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package)
NOTE: Running task 1903 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: Running task 1904 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 1906 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile_ptest_base)
NOTE: Running task 1907 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1908 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: Running task 1909 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 1910 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Started
NOTE: Running task 1911 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: Running task 1912 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 1913 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: Running task 1914 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: Running task 1915 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Started
NOTE: Running task 1916 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Started
NOTE: Running task 1917 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package)
NOTE: Running task 1918 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1919 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1920 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1921 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Succeeded
NOTE: Running task 1922 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Succeeded
NOTE: Running task 1923 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata)
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Running task 1924 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Running task 1925 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1926 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata unihash changed to 558f38a19f28fb5c8a58a9cbfeb14eb6f731e0405abee229211b031836ec94b8
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: Running task 1927 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: Running task 1928 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: Running task 1929 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: Running task 1930 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package)
NOTE: Running task 1931 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata)
NOTE: Running task 1932 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata unihash changed to ec73ce493b89ed5cd9ff505db810dd5259455571c453194d8cd65b24edda9334
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1933 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata)
NOTE: Running task 1934 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1935 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata unihash changed to 0dfdcba6a66cca8d26918fad26164d2db7dfb4cb26ecf57f13259a7607b27592
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata unihash changed to c5665682414892dcfc4cb994820b21cd086915dd5e7bb1cb399b94bd49196b59
NOTE: Running task 1936 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: Running task 1937 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm)
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata unihash changed to 45b435e702d5fae8c383cc65d76593885e37a57985fb994fa9a979492eb64d4d
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata unihash changed to 1162ed51672f5b7d9e23de609798397d5e2bb94ceb0b116c5b198cd3c980e5ca
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata unihash changed to e4ad1500efd62c6c7a17ed1dc20e6bc52e89c45479b73306188eab5c43e192f5
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata unihash changed to 74a95a5e5a1cd18eb3bcb1f438504f9034e1cbddc3c4b9d60b1f7ef93657aa13
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: Running task 1938 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata unihash changed to 1b24324f2a34b6eeab7f02b0f6453bed562bbf466802a1eb5559034aefd2846f
NOTE: Running task 1939 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: Running task 1940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: Running task 1941 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata unihash changed to 2e40d3a93e0fc69501c80f5b11fd98411a7f66bea6fb1c356e044b377ced7d28
NOTE: Running task 1942 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: Running task 1943 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: Running task 1944 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1945 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package)
NOTE: Running task 1946 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: Running task 1947 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: Running task 1948 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1949 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: Running task 1950 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package)
NOTE: Running task 1951 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Started
NOTE: Running task 1952 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 1953 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1954 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata unihash changed to cd322b5aff8d22fed788a24fbc4a33c05192fb3fddbc82770a6025c382fe2a0c
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: Running task 1955 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1958 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: Running task 1959 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package_write_rpm)
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: Running task 1960 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: Running task 1961 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: Running task 1962 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 30fad3cb10afa82f73097ea3006007d9b130c5fad9196974acdc2d24c858b03d
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata unihash changed to 4ee5ebb071bdb1d4b0fc24e448c034c5c7d9e472cac154a3afb6c2133710e2cd
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Started
NOTE: Running task 1963 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: Running task 1964 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata unihash changed to 49a4c5eb687524c01441228fc67f9d02836ae3e3c6eba6a8e73efbafe83b1f6c
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to 5d39fea3cc4e11c14885ad84d0e300d35778390b20d9d35339c0afdf0eeff103
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1965 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: Running task 1966 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata unihash changed to f8fc5885a68b74590ea8c6fbda0ed2db8708ded6a2e019056bc8bf1c2f65ce38
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Succeeded
NOTE: Running task 1968 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata unihash changed to 25f5392a135797c12b3d430560c9f05bd951b65e722dd210e7508e29760c0f7b
NOTE: Running task 1969 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata unihash changed to 392cfee10c01d38b900917e0d2cf8a894b3d413b10afcbcbd317f2787291d430
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1970 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Started
NOTE: Running task 1971 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: Running task 1972 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: Running task 1973 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1974 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to 452103cbcdbe4170a2e551ca80f9453db0f577036e20e62b9b46cc7b7db7f65b
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1975 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1976 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Running task 1977 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata unihash changed to 5468e2bef1d1414c0efdcf18b0e663a7cdeb22f29523bea2132bd6dd6787bbe3
NOTE: Running task 1978 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: Running task 1979 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata unihash changed to 5f360c4712d1b58c24638a153036928586d3e4272e62fda17aaf5d3407c5c0d3
NOTE: Running task 1980 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: Running task 1981 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Succeeded
NOTE: Running task 1982 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1983 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata unihash changed to 8eeb78843bc435c3edfac5b2e09edca0633c17b45bf5b9e8e93cd73b4221d81e
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1985 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata unihash changed to 24dcf6dfade6e95ba06023d5cf79a9bd3fb7d84cc54c79d2acc5cf38be9dd344
NOTE: Running task 1986 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: Running task 1987 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1988 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1989 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata unihash changed to 38abc9f6f20e47b7047e587fc9133eb0ec32d57b3fa6a81dc8b22a518a4037b3
NOTE: Running task 1990 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1991 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata unihash changed to 89f4bf7094313dc77d6898e4a78ec1f3053d3ad1428f5d2450a7a021517379dd
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata unihash changed to 2f8c84b6e725238dd50ebeade0fff1d78c75d7b58462336d6978af6aab20d8bc
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to c1aaa0c32b9b915e739e166102dc24b7f387b525989f117780568ab0a9e094ba
NOTE: Running task 1993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: Running task 1995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: Running task 1996 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata unihash changed to 6f1e76be46311ecbcc77aaa50111afecaa9c9f8e18d288771e0ffe237fca214a
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata unihash changed to 64f12de52dbe5929a0cf6710b338aa36abecfd3d354f6b53dc794980d499d7e4
NOTE: Running task 1997 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1998 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: Running task 1999 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 2000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata unihash changed to 71f09d494c0363d5fd63d801497c2583608ccbdf4b8cdc64529e068464e12ee8
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: Running task 2002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2004 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata unihash changed to 6647258b5ab4622895f90fe66d905ddad2bb404db5a6ccbc8eb7fc689e213dd0
NOTE: Setscene tasks completed
NOTE: Running task 2005 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2007 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_package: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: Running task 2008 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Running task 2009 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata unihash changed to a712ffcc6f69ba227a5d6088a25b3a167de039a73acd273e7ff13f1ccc9f73fd
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata unihash changed to e8b414021058ffe404137b659b8ec61142a337a54eff7a3e116447fdf2235068
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata unihash changed to c2bca2bb439bc9922f16f801deba4fa07c0cb9c2ac9245dd8b81f34cf4030c43
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata unihash changed to a1a3c63239ce921625281af758795c541463793a9b1fd3140948e982ce741b11
NOTE: Running task 2010 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata unihash changed to 70d83f1629916415affd6a0acac86d06f0fc59ac888c20b1e3b1615144943050
NOTE: Running task 2011 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: Running task 2012 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: Running task 2013 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2014 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2015 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: Running task 2016 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata unihash changed to 9cd0a9703399367a8493e88f0e87b8be1709fa05a3c26cc791f7c1c3a8ccfc25
NOTE: Running task 2017 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: Running task 2018 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata unihash changed to 0992d2c3ca7da3fe3d39bf818959d95b1a46ef122c8342db748deb384b8319b5
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2019 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata)
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2022 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Started
NOTE: recipe kmod-28-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_packagedata: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 2024 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2025 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2026 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to e3cb8dd60437b91169b6adf8cea65c1cb9d6b6c8b2b13a1a8679019e3ced3a21
NOTE: Running task 2027 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata unihash changed to 8ff44a45393cefd47ec1afa4f4c0f1648613a61476e6a66358b0b943bdac1d4c
NOTE: Running task 2029 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2030 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata unihash changed to 6eb263264d96e48c4060193fac5f2a180f72edc35c50fc9464e4523dac3d0b06
NOTE: Running task 2031 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata unihash changed to 0e05f4ff2178cc199237cbc953edfdee154e017ec6485d2dc7067f7807de291b
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata unihash changed to 257b1f8b03302f29d49b80b29a4e355a4b75e63c5562acef64713d6cab2ee786
NOTE: Running task 2032 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: Running task 2033 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata unihash changed to d858909fa6819ec790e22482055553b489fdc767e81733fc3c7d6067d4e22e40
NOTE: Running task 2034 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm)
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata unihash changed to 0042afd8d2eed9c4f98acf10cb6a2738cd54e37ddc982e827b7ba59af13507f3
NOTE: Running task 2035 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata unihash changed to de667da65aab7359103afc3e4fcef14e145fa2e7a5e28e49a77b43cf135a8ddc
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2037 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata unihash changed to c5cae2d97c935128424f79a5988c962df2eef93569488770b7d19fbc705a7a93
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: Running task 2039 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata unihash changed to 0a383afa3aaf43cf44572c2f8f5b11aa64487a545bcd13d41d7a488aaca98822
NOTE: Setscene tasks completed
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2041 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata unihash changed to 59618362af0e40f8dd49a56feb6778b00d7cdcb09b3bcdc14e537a52cb65f3c0
NOTE: Setscene tasks completed
NOTE: Running task 2042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: Running task 2043 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2046 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 2047 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata unihash changed to 64cf0906d81261f92610074770423a4607b04cddcd3d00411b01bf73b215ce62
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata unihash changed to 572e2df20e7ab96e9e5163bff861dab48a64e26b0e41743a3a91c772ad643996
NOTE: Setscene tasks completed
NOTE: Running task 2048 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: Running task 2049 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2050 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_compile)
NOTE: recipe bison-3.7.5-r0: task do_compile: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata unihash changed to 86ebf728259d2a8c2a2b70bc84e82b56cf145ca0d932c23c43557e2657285faf
NOTE: Running task 2054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package)
NOTE: Running task 2055 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Succeeded
NOTE: Running task 2056 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_install)
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata unihash changed to da21008646c7caba4385ec360ad11d49bd7f094c7bb7cc5f0c4ccc60649be78f
NOTE: recipe bison-3.7.5-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2057 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package)
NOTE: Running task 2058 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package)
NOTE: Running task 2059 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Started
NOTE: recipe bash-5.1-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package)
NOTE: recipe bison-3.7.5-r0: task do_package: Started
NOTE: recipe libpam-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2066 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2067 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata)
NOTE: recipe readline-8.1-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata unihash changed to 81a00d4e0f2158570ecfd8493745f69ce85befe592a6f30d836ba166871d5f3f
NOTE: Running task 2069 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: Running task 2070 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2071 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 2072 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata unihash changed to 0a421d39eba6e4e44d833eb3e96b5d8cd1d1fcda6b9fee30a791af6fcb4dd994
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package)
NOTE: Running task 2074 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: Running task 2075 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package)
NOTE: Running task 2076 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2077 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata)
NOTE: Running task 2078 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package)
NOTE: Running task 2079 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.48-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata unihash changed to 714efa1b536c8f25f4a977b83aa8e7923ba6290b538c4bc6939c9f1e737f40be
NOTE: Running task 2080 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package)
NOTE: Running task 2081 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: Running task 2082 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata unihash changed to aeba1a687397e42aad20e7303e7f4743fa3a98ce4a78ef50932b4f00e8146d08
NOTE: Running task 2083 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata unihash changed to dc0cf1dee23820fcebb77133d166aeebc472a916838b255ea7c8abe8312febd9
NOTE: Setscene tasks completed
NOTE: Running task 2084 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: Running task 2085 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package: Succeeded
NOTE: Running task 2086 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata unihash changed to 3b82e71fdff7a7c4499328a9f04841bb3942862c8e831a45f10cca947e2c8929
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: Running task 2088 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: Running task 2089 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: Running task 2090 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe bash-5.1-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata unihash changed to d238495394bcabc3f1261f57077e27c11abf039cb0b0bca7f137a3bf410fcc76
NOTE: Setscene tasks completed
NOTE: Running task 2092 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: Running task 2094 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: Running task 2095 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2097 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata unihash changed to 257cd6dfe345f016b3a6c009749f746f91416b7ff5a96d0dbf862e01d7464bb7
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2099 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 2100 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata unihash changed to 70b717c8085e81a7d555edb43d2bf2dd2c544eeed7b304c446cc7270e8605163
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: Running task 2101 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata unihash changed to b76bce1a5df7ba6d607396b3de8045d7525a9d68d5d2c35afbbf389c419a26eb
NOTE: Running task 2102 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata unihash changed to a3cc67554c6adcd7c2fd526b50ab7549fd892d2390f3e7a478f94a04a6b336b2
NOTE: Setscene tasks completed
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to d851d2243fe41871c849ff34642a52eae9e7d93c02ab1ffacc06c230dff6823f
NOTE: Setscene tasks completed
NOTE: Running task 2104 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2107 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to 2ac2b809c3d676123e088d394d504d20a2413c8a1deb6e86ac7c5a7843dee6b1
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package)
NOTE: recipe socat-1.7.4.1-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata unihash changed to c9d7fed8e87b0b10abf19036f5864a89688b807fa4fa2c8f5e07a4ef09b36364
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package)
NOTE: Running task 2116 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package)
NOTE: Running task 2117 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2119 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 2120 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Succeeded
NOTE: Running task 2121 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2122 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2124 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: Running task 2125 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: recipe perl-5.32.1-r0: task do_package: Succeeded
NOTE: Running task 2126 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata)
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata unihash changed to b123e5ce807b4bc866e18e5b43c1c98f32bb6c8892dd0bdaec377933f0b6cea3
NOTE: Running task 2128 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2129 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 2130 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2131 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: Running task 2132 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2134 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 8e625311ffa40d333aafb6b2ab978afa8f5368dac82c39b639107d8b6a84b413
NOTE: Running task 2135 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2137 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata unihash changed to 49f66b5df35d20326572ec1652a6746f65f8631c449ee55823f8277be6b2cafe
NOTE: Running task 2138 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2139 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 6d76169cef04565946655a46cc38dcd602c18587eb5b2ed8520c20709e2efc30
NOTE: Running task 2140 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2141 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata unihash changed to 149278ae760ed313277e1075c1b4ee88dd609076450f337a61bf6ba3cc65ee0b
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2142 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: Running task 2143 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: Running task 2144 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package_write_rpm)
NOTE: Running task 2146 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2147 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: Running task 2148 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to 3a700d687e962503118a05d0987281c53f20e027d76b078197bb52a3f03768bf
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: Running task 2151 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to 22bde9a629b8ec9b2b704f6a1fd177d021e7a0c13e8a1aefe5192c0a09c235b5
NOTE: Setscene tasks completed
NOTE: Running task 2153 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: Running task 2154 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: Running task 2155 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2156 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to aadb45b5e9aefbd76e502a7019d7d39563f33d7b2245c6c0d0fb2e16b64a0f90
NOTE: Setscene tasks completed
NOTE: Running task 2159 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 080b0845b1b5c047f59691919903ccbcc646d4c26f6ba8e53ff3d4c4fbd9de6e
NOTE: Running task 2161 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2162 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm)
NOTE: Running task 2163 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 7549ec8eb6cd950c40177c40eefbbdc641238fdc8a1a8d41a5af0e6f97d98d8c
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: Running task 2165 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2166 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 2169 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata unihash changed to dd40d95a53ab386e3d56470fa008d18f59dc8f290205d89980619e8278866d4f
NOTE: Setscene tasks completed
NOTE: Running task 2171 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: Running task 2172 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2173 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to b47dd8f64306b106c72e5db2218fc5fda72a53ecd588c75d4c41539bd1607b4d
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 62bdba6b49805a6c65dc0a4a30daeffc3514067fca0ce2b44b0c796b244928d7
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to d2333b7a2e8ad5f0392164499cb528f3d185e68338cacbad98834b8502e6c485
NOTE: Setscene tasks completed
NOTE: Running task 2180 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2181 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2182 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2182 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4180759231048520356==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-rpm-upgrade-4.16.1.2-4.16.1.3.patch"

From 51f3f8d2ee1eee3a4866a31759d271b0da7088cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 07:29:41 +0000
Subject: [PATCH] rpm: upgrade 4.16.1.2 -> 4.16.1.3

---
 ...ot-hardcode-lib-rpm-as-the-installation-path-for.patch | 8 ++++----
 .../rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb}              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb} (99%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 38d755205c..b5ea0c24de 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 9bbe3f8564705aafcdcc5f2f033f9241a97f47c6 Mon Sep 17 00:00:00 2001
+From 1d8e37571e15929191b5310d0523f3eb9283f176 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6c78568e4..76b1d40e4 100644
+index fe35a90fa..b2faec6f3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -966,7 +966,7 @@ else
@@ -40,7 +40,7 @@ index 35c8cf9df..9d8b2825c 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index cd40a16be..e6941e09f 100644
+index 8e1dc2184..3d889ec86 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index cd40a16be..e6941e09f 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 10:2:1
+ rpm_version_info = 10:3:1
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
similarity index 99%
rename from meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
rename to meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index d369c706a2..7c03b41fc8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            "
 
 PE = "1"
-SRCREV = "278883a704ea36c97974d0f2d65d41abe78b0e2a"
+SRCREV = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============4180759231048520356==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54431528748b0dbe84617a558403c4bfc52e6523"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 310 Local 5 Network 0 Missed 305 Current 378 (1% match, 55% complete)
Removing 109 stale sstate objects for arch qemuppc...done.
Removing 180 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 452 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_stash_locale_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 237 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_configure)
NOTE: Running noexec task 994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_compile)
NOTE: Running task 995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_install)
NOTE: Running task 1000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_unpack)
NOTE: Running task 1002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1021 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_fetch)
NOTE: Running task 1054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1262 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: Running task 1265 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: Running task 1315 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: Running task 1316 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1317 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1318 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1319 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata unihash changed to 583b3f0d53723faf33f1317dd0fc915f68bfcd26d2317bd0813f77f2e524db78
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata unihash changed to bae9d0ade24de3fcd867afcd96d218ca3cb2045579f35f3282defa4febb6e3d0
NOTE: Running task 1320 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic unihash changed to 777e4cd387d5e4bda3d55a8ce4020b5bc41fab7d890f9993bf1189d0944351f7
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d0d3d823acc00d90868e69c5d2f2b5c0c36c38484a110ab4d386f2d7342b2ea8
NOTE: Setscene tasks completed
NOTE: Running task 1321 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1322 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to d0afcac5c0b8e842ffcbfec4f5a9d4f34345437c57bf6651e51f4198c7a04424
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Succeeded
NOTE: Running task 1337 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package)
NOTE: Running task 1350 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1353 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_configure)
NOTE: recipe glibc-2.33-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Succeeded
NOTE: Running task 1354 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata unihash changed to 0c6ad4706219934ce492d540823dd24a7f9a30a8a3fb2595529e08f9af966c5b
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-2.33-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_compile)
NOTE: recipe glibc-2.33-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Succeeded
NOTE: Running task 1357 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata unihash changed to 849673fbbbe7ec07e4b2ef09da7fcc765fd2a4d669ee9069adf52e30a35f0648
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy became valid
NOTE: Running setscene task 980 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running task 1358 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_install)
NOTE: recipe glibc-2.33-r0: task do_install: Started
NOTE: recipe glibc-2.33-r0: task do_install: Succeeded
NOTE: Running task 1517 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package)
NOTE: Running task 1684 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1750 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_configure)
NOTE: Running task 1870 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure)
NOTE: recipe bison-3.7.5-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Started
NOTE: recipe glibc-2.33-r0: task do_package: Succeeded
NOTE: Running task 1872 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata)
NOTE: recipe glibc-2.33-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata unihash changed to d0c6a8fc1e152a6fe85c7630ab24677d405af6ee588db0034951d7b1fa58c3ae
NOTE: Setscene tasks completed
NOTE: Running task 1874 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package)
NOTE: Running task 1875 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package)
NOTE: Running task 1876 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm)
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1877 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure_ptest_base)
NOTE: recipe glibc-locale-2.33-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1878 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata unihash changed to 8f947ecf3e34b1466570f4f2f6e44472759c84bb4f3fce2fb9bb4bcdaba28477
NOTE: Setscene tasks completed
NOTE: Running task 1883 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package)
NOTE: Running task 1884 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1885 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata unihash changed to b0b51530c5913db0381f8c048092958833b5289c380aadda9fc71b32109640bb
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: Running task 1888 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: Running task 1889 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package)
NOTE: Running task 1890 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1891 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1892 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: Running task 1893 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 1894 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package)
NOTE: Running task 1895 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package)
NOTE: Running task 1896 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package)
NOTE: Running task 1897 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: Running task 1898 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package)
NOTE: Running task 1899 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1900 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1901 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: Running task 1902 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package)
NOTE: Running task 1903 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: Running task 1904 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package)
NOTE: Running task 1905 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: Running task 1906 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1907 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: Running task 1908 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 1909 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 1910 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: Running task 1911 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: Running task 1912 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: Running task 1913 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: Running task 1914 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package)
NOTE: Running task 1915 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: Running task 1916 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package)
NOTE: Running task 1917 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Started
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1918 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1919 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1920 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Succeeded
NOTE: Running task 1921 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1922 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_package: Succeeded
NOTE: Running task 1923 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Running task 1924 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata unihash changed to a9e45492e004c213f5b60411fb3cd0819e50d845e7c9d9b1a4869e9b1500f8d9
NOTE: Running task 1925 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: Running task 1926 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Succeeded
NOTE: Running task 1927 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata unihash changed to a82e82b58662ed989bfd44b74b41ab86454edb29cbf018277c72c2224e93afaf
NOTE: Running task 1928 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm)
NOTE: Running task 1929 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Running task 1930 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata unihash changed to a2d00809c772f7d179cec7f62c2ceb18899aeaba6ee1500da3eb2790205cafff
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata unihash changed to 47474c30ec3426a3760d4dafa2d39f66cb0fbf4736f424eb8c65246bebe77a8e
NOTE: Running task 1931 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: Running task 1932 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package)
NOTE: Running task 1933 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 1934 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata unihash changed to f50acbd681a57b55136480f71d029df00132043a56634a5843ed0690fb5da4da
NOTE: Running task 1935 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1936 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata unihash changed to 448b2733f4a30f0aa27591994c3eea7053f16c709b235cecca57464fa437f777
NOTE: Running task 1937 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: Running task 1938 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1939 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: Running task 1940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Succeeded
NOTE: Running task 1941 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata unihash changed to cbabe9ed4290aafd6ac6c4245bc511bbf4c08b7446659640dc873b82523b724f
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Started
NOTE: Running task 1942 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: Running task 1943 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: Running task 1944 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: Running task 1945 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: Running task 1946 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: Running task 1947 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package)
NOTE: Running task 1948 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: Running task 1949 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata unihash changed to 261412279b52e9f29f4b775dec9024a50a8642f17237f499f7d77cafc240210c
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: Running task 1950 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Started
NOTE: Running task 1951 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Succeeded
NOTE: Running task 1952 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: Running task 1953 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata unihash changed to 4e6c17db7adae563bb91851b1eff54923a1b834903a9a4b6af8d8523c2626eab
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Started
NOTE: Running task 1954 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1955 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Succeeded
NOTE: Running task 1956 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: Running task 1958 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1959 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata unihash changed to 9c8a0d3f7415db51ce08a1783694b60d42f2f6941c7556a5bca8fdcef63a1875
NOTE: Running task 1960 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to c88d30828eddf54f50069e5a785661efb69fca5a78e42f58adcb308beb21abe4
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: Running task 1961 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata unihash changed to 0ecb6c6e035fa422af0f2d961702270d7cdb69aba2426257276303aadb752f41
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata unihash changed to 33c8e6419db14696226d71bf6762895fed83c85aae07cd8455b14126ed5fd66c
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata unihash changed to baa2d61957c28bcfd7b7acf89c2313a0f4ccb59d39d6b8ef74e726add2574d77
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata unihash changed to 919d775b1a6aba33465ee27c7579600faf7d848504b3e519f86573306d886b13
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata unihash changed to 0f81948f23dc120d43edadf62d36587a444e1f314c9e5a2192025ee67eaa558e
NOTE: Running task 1962 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: Running task 1963 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata)
NOTE: Running task 1964 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1965 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1966 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata unihash changed to 795090738a011d63b587995d46fc8e959570f9f3aa69926de0ba62f3065b5936
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1967 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Running task 1968 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Running task 1969 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: Running task 1970 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 1971 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1972 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: Running task 1973 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1974 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata unihash changed to 2a546212786e4bcf84cabeb78a1814bfa93be70c8284438243253ed596cb2a72
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to 9a6f6547d346f73c914640a194c8b47ef1a31662b9a7866cc6e6829cb1bdbe91
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata unihash changed to ad504f0b67d54696f24461360ac360b45a06468d52a2216be86418af7f8ff669
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1976 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1977 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: Running task 1978 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: Running task 1980 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1981 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: Running task 1982 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: Running task 1983 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: Running task 1984 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 1985 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to 71dc1abf6dda61751c416df4d0177c32edb8e4110cf83cd6f8d957d0c470389d
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata unihash changed to 3d0f59a23380b98d3c976117c283c15e9e3b913db42d492df43d8ca547175c81
NOTE: Running task 1986 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1987 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata unihash changed to 66214077c0c44e90eac235886e0bc37fce64a1de02889440bd6fbe5f8033de64
NOTE: Running task 1988 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to 9f31d5b5e23e23a8442bf01a7223565451d7f40e3f665cf368e10d3e4ac76941
NOTE: Running task 1989 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: Running task 1990 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata unihash changed to 3767e536ed44b0a27887407833c48a99cae14f7afcf7e361ca936037034ae6f7
NOTE: Setscene tasks completed
NOTE: Running task 1991 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Succeeded
NOTE: Running task 1992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1996 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata unihash changed to a659f991c8564159222493c735b4bee9ae795e2c706c88131be6e2d758c7e35f
NOTE: Running task 1997 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata unihash changed to 509789ab4cb1c8df6414c9ed2314bb53738319fe87f92b9cbb90fd25127c5654
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1998 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: Running task 2000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: Running task 2001 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 2002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2005 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata unihash changed to 4c8fd64bb0e5ffe7c17540d6ab879b14cd9eef36483b3bdc3e65eab6acc15617
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata unihash changed to 8a2bad08c272be292a1f0b408acd09e591231f9294895efcfa9bb266d5094f17
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: Running task 2006 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: Running task 2007 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: Running task 2008 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata unihash changed to 25c7da0ad2c50680d19a0f0505c90ac765d89221e4ad70bd10635b7a0873fcca
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata unihash changed to 73943517c8a45866c06aec8854c8fe1ab0dc51e46445a2585113c04fa6435c78
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata unihash changed to f2dbb081d3d740ef8c7b616cb5de035f1d654f3dfcf032da43481a38a92dcec2
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-28-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata unihash changed to 8273b56f6e30e92eb128b4264f769e8d1350893b053047b01b92afbba137833f
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata unihash changed to f28dd7f54ce1f3d32b4c621a964dfba88a26dfaa73e8cb7728ea31ecce9cccaa
NOTE: Running task 2009 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: Running task 2010 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: Running task 2011 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: Running task 2012 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata unihash changed to 1644333f9fe7c45e7282998fde8b00a0a3a0eb03a0ff7db14737863a6b9634f5
NOTE: Running task 2013 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 2014 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata unihash changed to 2cbef69a3f31716683410283f0a4921e1a17895cd61f229122ad24fef65ad540
NOTE: Running task 2015 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: Running task 2016 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: Running task 2017 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: Running task 2018 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: Running task 2019 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata unihash changed to 76621e743ccb1e41f4aab1987195964f3b8354d0e1583bb417c8aabeabd3c8c1
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: Running task 2021 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata unihash changed to 2e5790002dd3b4bd3d3863a8097b8cfd493554061dc1e3093ed7e9933defb714
NOTE: Running task 2022 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2024 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata unihash changed to 97074538a96a43e81101ab9e9a77c44d20438a6f90822a46142247f2c20de982
NOTE: Running task 2025 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata unihash changed to 3dc9975026cf435b87737be827d9cdd1b632c4f486e6009ba5cc098826425222
NOTE: Running task 2026 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata unihash changed to 96b3155141fa43f3bf0fe147b96f86d47ab63ed5c7fb1042ce2924b79a8f7dfb
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: Running task 2027 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: Running task 2029 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata unihash changed to 0dd4e5344046cd90e13b91068c0673c0b47d9187d87a9f03ff23730a13845e44
NOTE: Running task 2030 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2031 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata unihash changed to 424c2638bca6ced817c50183f6a916616269ad9ead682f7de9307ad19ed2880e
NOTE: Running task 2032 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to ce5d69aaec31f55bb1ac89be48309f04d9fc35b263e1e3e002c5a153cf814ad7
NOTE: Running task 2033 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata unihash changed to fb03bc73dffd344c807a1d1fb8230c4a76feba8f13deb0fb67016fd56a973817
NOTE: Running task 2035 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata unihash changed to ef5c1783533b698cf111c6423ce7aa7c228f12041d593e3f5513ebf25649e961
NOTE: Setscene tasks completed
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2039 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata unihash changed to 92638f31e7cd8ff0322ca907c6401f632bd41310b1044c07a14bfe04ffaaa50b
NOTE: Running task 2040 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata unihash changed to ba40392730aaa6256155905e6f0bc986cd09ad652ba3bab683146882891ecdcb
NOTE: Running task 2041 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: Running task 2042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata unihash changed to 4cabdbe81593ae6831703f9c3c8667852a31305429c485289c666ab8fde2a06d
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata unihash changed to bdb81290b0a248cd38cc7c133c74617fbe43cebdcefb1031c9f6fda015ea81e5
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2045 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2046 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package)
NOTE: recipe libpam-1.5.1-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2047 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_compile)
NOTE: recipe bison-3.7.5-r0: task do_compile: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_install)
NOTE: recipe bison-3.7.5-r0: task do_install: Started
NOTE: recipe bison-3.7.5-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package)
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 2055 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: Running task 2056 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe bison-3.7.5-r0: task do_package: Succeeded
NOTE: Running task 2058 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2060 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata unihash changed to 78f50ce19d822a3a75c3872cf9ef0c9be91a2849604d4f820c06c07e7e5660dc
NOTE: Running task 2061 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata unihash changed to ce3a665c0864253b806bd3a1994404e40aa63380404942453dc72b34abab9296
NOTE: Running task 2062 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: Running task 2063 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata unihash changed to 602e0a97431ffbadaa984634b3b411ed674becf91c73a879077761d2acaeb258
NOTE: Running task 2064 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata unihash changed to 586a88e01d7a83ce21cb0b5815748806f542810090f1b774823bdf045233a6e9
NOTE: Setscene tasks completed
NOTE: Running task 2065 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package)
NOTE: Running task 2066 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package)
NOTE: Running task 2067 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_package: Started
NOTE: recipe bash-5.1-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata unihash changed to c50a5313b54d1dc2dce1ec715672015195df24341d09a74c59623f79e6a9e95b
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package)
NOTE: Running task 2070 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe readline-8.1-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata unihash changed to 1a9641a84919cbe2532d5e30c703b06dc34c26310c6cfbd84d2288d5f44b5030
NOTE: Setscene tasks completed
NOTE: Running task 2072 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: Running task 2073 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2074 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata unihash changed to a24d60e0e21545ba17680310ee0a9d9f4fd0b961c7bed3e034c6296a854ea624
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2077 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2078 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Started
NOTE: recipe bash-5.1-r0: task do_package: Succeeded
NOTE: Running task 2079 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_packagedata: Started
NOTE: recipe bash-5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2080 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm)
NOTE: Running task 2081 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: Running task 2082 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: Running task 2083 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 2084 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata unihash changed to 5f890cc4edd535b702177d1fca8f654fd729670697fcb9c97ff9e743514c333c
NOTE: Setscene tasks completed
NOTE: Running task 2085 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package)
NOTE: Running task 2086 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: Running task 2087 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package)
NOTE: Running task 2088 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2090 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to f4d43869131b9c05e2782e5ea5d636cd224800daa382b7ea22ed5d9a282812b2
NOTE: Running task 2092 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata unihash changed to 823961040356c4eabac1681c760841a4b59ffdab922278849f1ce1322e77ad59
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package: Succeeded
NOTE: Running task 2094 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata unihash changed to 2051e7e6b31bf8b86a07889cf3772a0faa664a71961cdda85fc7d6089f8f5ae2
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: Running task 2096 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: Running task 2097 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: Running task 2098 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 2100 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Succeeded
NOTE: Running task 2101 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata unihash changed to b045a0942bc6547a9a091f1423c1f24ccd0dc29dd19708c7648a89dd6c49f462
NOTE: Setscene tasks completed
NOTE: Running task 2103 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package)
NOTE: Running task 2104 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata unihash changed to cedea4955c9f766e97566c2e467c024812fbf74ff66f99a1bf7d63ab74007169
NOTE: Setscene tasks completed
NOTE: Running task 2106 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2107 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata unihash changed to 021fe6b267064c58716d7d3530243b9c629d1dfa63f9d1dca2161296267a84a6
NOTE: Running task 2109 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata unihash changed to f301c37b314a1046ac2f7ba8045f71b35cdf9e2d24c0fece475ea62dd335b7c0
NOTE: Setscene tasks completed
NOTE: Running task 2110 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2111 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to e20b22b8d71cf167a8e88712031f4834a12a8836f4aec39b6ca5c2a15f74b887
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata unihash changed to b67ce6c00d662bf0a38b2b5a514a4a02895f12f41ba59b32dbdbe3c778a3ea7b
NOTE: Setscene tasks completed
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package)
NOTE: Running task 2116 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package)
NOTE: Running task 2117 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2119 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 2120 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Succeeded
NOTE: Running task 2121 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2122 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata)
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata unihash changed to 8d9d05455a799b727244c5a3663a58d6cdd5a8146e64adc54bfde9cf85b27854
NOTE: Setscene tasks completed
NOTE: Running task 2124 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: Running task 2125 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 2126 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata)
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Succeeded
NOTE: Running task 2128 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2129 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: Running task 2130 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: Running task 2131 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata unihash changed to c019a19f7238de62e069288eff11afa4b74c5a79a0d67f26d5b3d1853af54f1c
NOTE: Setscene tasks completed
NOTE: Running task 2132 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2133 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 2134 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: Running task 2135 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2137 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2138 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: Running task 2139 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 626d71b3f63c89197cf0ee13a703baedf02f2793e8a2a4e39c8bd1d6b02b8b29
NOTE: Setscene tasks completed
NOTE: Running task 2141 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata unihash changed to f968f51001d65ddc476ea410116394e914ab88533bbcc5da15f3615de205548c
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2145 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2146 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 83e6eb10355295b387239767a1f5e662f77fbbbe79b003470ddaf94dd6aa040f
NOTE: Setscene tasks completed
NOTE: Running task 2147 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2148 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to f3c15fa35338ef0a2e4889bfec9ccc687c363cefc972723b287408bd080f6de1
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: Running task 2151 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to 51f707ce0ae0369f82a41d53739ffcc760a0ce51cb4114a55afb645a7a1de463
NOTE: Setscene tasks completed
NOTE: Running task 2153 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: Running task 2154 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: Running task 2155 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2156 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to d695a669d363a77ad9498a7012d942e765371c1cebfb4079a6af3e7dfedddee9
NOTE: Setscene tasks completed
NOTE: Running task 2158 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2159 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 7078d166d3ccd9dc04fa5bfefb625b8c10d84c2941ab43f31c1dbe3d21d7c574
NOTE: Setscene tasks completed
NOTE: Running task 2160 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2161 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm)
NOTE: Running task 2162 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 555bf89c29dce036a70f5be15a0d4160552b358cafe77768c5e99d35b6987c81
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: Running task 2165 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2166 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 2169 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata unihash changed to db9b24b77cde19bbd78ca9dfd90ed576222bdb6ee5243255bd215f146579a1bf
NOTE: Setscene tasks completed
NOTE: Running task 2171 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: Running task 2172 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2173 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 03ab1fb9061562f8fb5c31369b03d502cd5a39cbe5377451909f2b97208f0558
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to cacffe8ff772413fde5efa98dc0c42c1cbe3ce29f7d6d2803338e23077817816
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 46e402534262e282fae7aae2d0b04bc87b85c174f3f605700565440005660623
NOTE: Setscene tasks completed
NOTE: Running task 2180 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2181 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2182 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2182 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4180759231048520356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 98 recipes from the core2-32 sysroot...done.
Removing 101 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:54431528748b0dbe84617a558403c4bfc52e6523"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 502 Local 187 Network 0 Missed 315 Current 197 (37% match, 54% complete)
Removing 5 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 217 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 232 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 235 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 238 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 246 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 256 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 275 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 344 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 668 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 669 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 676 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_fetch)
NOTE: Running task 677 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 678 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_fetch)
NOTE: Running task 686 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_fetch)
NOTE: Running task 687 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_fetch)
NOTE: Running task 688 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 707 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 718 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 721 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_fetch)
NOTE: Running task 722 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 723 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 724 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 725 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_fetch)
NOTE: Running task 726 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_fetch)
NOTE: Running task 728 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 729 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_fetch)
NOTE: Running task 730 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_fetch)
NOTE: Running task 731 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_fetch)
NOTE: Running task 733 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 734 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_fetch)
NOTE: Running task 735 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: Running task 736 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 737 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_fetch)
NOTE: Running task 738 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_fetch)
NOTE: Running task 739 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_fetch)
NOTE: Running task 740 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe bash-5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 752 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_fetch)
NOTE: Running task 811 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_fetch: Started
NOTE: recipe m4-1.4.18-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: Running setscene task 459 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: Running setscene task 530 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: Running setscene task 533 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 559 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.18-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_fetch)
NOTE: recipe mdadm-4.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: Running setscene task 576 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 863 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_unpack)
NOTE: Running task 865 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_unpack)
NOTE: recipe binutils-2.36.1-r0: task do_fetch: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_fetch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_fetch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe systemd-conf-247.3-r0: task do_fetch: Started
NOTE: Running task 866 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe systemd-conf-247.3-r0: task do_fetch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Started
NOTE: Running task 867 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_unpack)
NOTE: Running task 868 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: Running task 869 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 870 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: recipe grep-3.6-r0: task do_fetch: Started
NOTE: Running task 871 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.6-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running setscene task 577 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 872 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: Running task 873 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_unpack)
NOTE: Running task 874 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_unpack)
NOTE: Running task 875 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 876 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_unpack)
NOTE: Running task 877 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_fetch: Started
NOTE: recipe kbd-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.8.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_fetch)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 880 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 881 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: Running task 882 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_unpack)
NOTE: Running task 883 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 884 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_unpack)
NOTE: Running task 885 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_unpack)
NOTE: Running task 886 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 887 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: recipe binutils-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 889 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_unpack)
NOTE: Running task 890 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1-r0: task do_fetch: Started
NOTE: recipe bash-5.1-r0: task do_fetch: Succeeded
NOTE: Running task 891 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_unpack)
NOTE: Running task 892 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 893 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_unpack)
NOTE: Running task 894 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 895 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_unpack)
NOTE: Running task 896 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Started
NOTE: recipe diffutils-3.7-r0: task do_unpack: Started
NOTE: Running task 901 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe m4-1.4.18-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe systemd-conf-247.3-r0: task do_unpack: Started
NOTE: Running task 902 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.32.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 903 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 904 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_fetch)
NOTE: Running task 905 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_unpack)
NOTE: Running task 906 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
NOTE: Running task 907 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_unpack: Started
NOTE: recipe mdadm-4.1-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_unpack: Started
NOTE: Running task 908 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 909 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 910 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: Running task 911 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 912 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 913 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: Running task 915 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running task 916 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_patch)
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe kbd-2.4.0-r0: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 917 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_fetch)
NOTE: Running task 918 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_unpack)
NOTE: Running task 919 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: Running setscene task 585 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_unpack: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 586 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 928 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_patch)
NOTE: recipe grep-3.6-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.8.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 929 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: recipe binutils-2.36.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_prepare_recipe_sysroot: Started
NOTE: Running task 930 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_patch)
NOTE: Running setscene task 587 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 931 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 932 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: Running task 933 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 934 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: Running task 935 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 936 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 937 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_fetch)
NOTE: recipe init-system-helpers-1.60-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: Running task 938 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_patch)
NOTE: recipe socat-1.7.4.1-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: Running task 939 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_unpack)
NOTE: Running task 941 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 942 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_patch)
NOTE: Running task 943 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 944 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 945 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_patch)
NOTE: Running task 946 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 947 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_patch: Started
NOTE: Running task 948 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running setscene task 588 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 949 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_patch)
NOTE: Running task 950 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 951 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe bison-3.7.5-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 952 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_patch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: Running task 953 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: Running task 954 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_unpack)
NOTE: Running task 955 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_patch: Started
NOTE: Running task 956 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_fetch)
NOTE: recipe kbd-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: Running task 957 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running setscene task 589 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 958 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_patch)
NOTE: recipe diffutils-3.7-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_unpack: Started
NOTE: recipe m4-1.4.18-r0: task do_patch: Started
NOTE: Running task 959 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_patch)
NOTE: Running task 960 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 961 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: Running setscene task 593 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 962 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 963 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_patch)
NOTE: Running task 965 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_patch: Succeeded
NOTE: Running task 966 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Started
NOTE: Running task 967 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_unpack)
NOTE: Running task 969 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: Running task 970 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: Running task 971 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_patch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: Running task 974 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 976 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe diffutils-3.7-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe grep-3.6-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_fetch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_configure: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_patch: Succeeded
NOTE: Running task 982 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_unpack)
NOTE: recipe perl-5.32.1-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 984 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_patch: Started
NOTE: Running task 985 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_unpack)
NOTE: recipe init-system-helpers-1.60-r0: task do_patch: Succeeded
NOTE: recipe grep-3.6-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: Running task 988 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: Running task 989 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 990 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe socat-1.7.4.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_configure: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: Running task 992 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_compile)
NOTE: recipe diffutils-3.7-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 996 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running setscene task 594 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_unpack: Started
NOTE: Running task 1004 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_compile: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1005 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_fetch)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running setscene task 596 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1007 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1009 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_patch)
NOTE: Running task 1010 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1013 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_patch)
NOTE: Running task 1016 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: Running task 1021 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_unpack: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: Running task 1022 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_unpack)
NOTE: Running task 1024 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 1025 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_patch)
NOTE: Running setscene task 597 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1027 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 1028 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_patch)
NOTE: Running task 1029 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Started
NOTE: Running task 1030 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 1031 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 601 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 1033 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_fetch)
NOTE: Running task 1034 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: Running task 1035 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_warn_musl)
NOTE: Running task 1036 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_write_config)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe perl-5.32.1-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_patch)
NOTE: Running task 1044 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_patch)
NOTE: Running task 1045 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1046 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic)
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 1047 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe libpcre-8.44-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: recipe bash-5.1-r0: task do_patch: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_install: Succeeded
NOTE: Running task 1048 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1049 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1050 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1051 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_fetch: Started
NOTE: recipe perl-5.32.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
WARNING: systemd-1_247.4-r0 do_warn_musl: Using systemd with musl is not recommended since it is not supported upstream and some patches are known to be problematic.
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Started
NOTE: Running task 1053 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe libx11-1_1.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 607 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Started
NOTE: Running setscene task 608 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1054 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: Running task 1055 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running task 1056 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_write_config)
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1057 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_fetch)
NOTE: Running setscene task 616 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1058 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic unihash changed to 777e4cd387d5e4bda3d55a8ce4020b5bc41fab7d890f9993bf1189d0944351f7
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1060 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: Running task 1061 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Started
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 618 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_patch: Started
NOTE: Running task 1072 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1073 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 1074 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 1075 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Started
NOTE: Running task 1077 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: Running task 1078 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1079 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.48-r0: task do_fetch: Started
NOTE: Running task 1080 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 1081 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1082 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_fetch)
NOTE: Running task 1083 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_unpack)
NOTE: Running task 1084 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 625 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1085 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_write_config)
NOTE: Running task 1086 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_unpack)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libpcre-8.44-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1089 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-28-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_unpack: Started
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Started
NOTE: recipe acl-2.2.53-r0: task do_unpack: Started
NOTE: recipe mdadm-4.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1092 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1093 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1094 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Started
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-28-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1096 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_unpack)
NOTE: Running task 1097 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 632 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1098 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_fetch)
NOTE: Running task 1099 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_patch)
NOTE: recipe libx11-1_1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: Running task 1100 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running setscene task 634 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_fetch: Started
NOTE: recipe bash-5.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: Running task 1103 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe kmod-28-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_fetch: Succeeded
NOTE: Running task 1104 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1105 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Started
NOTE: recipe perl-5.32.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 635 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.48-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_unpack)
NOTE: recipe acl-2.2.53-r0: task do_patch: Started
NOTE: Running task 1108 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_patch)
NOTE: recipe libx11-1_1.7.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1109 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1110 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 636 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1111 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1113 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 1114 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1116 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: recipe libcap-2.48-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running setscene task 638 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1117 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1120 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running setscene task 639 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 1121 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: recipe elfutils-0.183-r0: task do_patch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: Running task 1123 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1124 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1125 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: Running task 1126 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_fetch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1127 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1129 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: Running task 1130 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: Running task 1132 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_patch)
NOTE: Running task 1134 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libcap-2.48-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1137 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Started
NOTE: Running task 1138 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running task 1139 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1140 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: Running task 1141 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_patch)
NOTE: Running task 1143 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe shadow-4.8.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1144 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_unpack)
NOTE: Running task 1146 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_unpack)
NOTE: recipe kmod-28-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1147 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 1149 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: Running task 1150 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1151 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.19.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: Running task 1152 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: Running task 1153 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe kmod-28-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 1156 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1158 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1165 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_patch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata unihash changed to 72d66638372fff07df8a0f5f532169173c54ca219b5df0b402c19447adae74fa
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1166 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Succeeded
NOTE: Running task 1167 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_patch)
NOTE: recipe expat-2.2.10-r0: task do_patch: Started
NOTE: recipe kmod-28-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata unihash changed to 827e6b32383e824a635a36033865f73d89b09b01132dcc2b53711609c6453db9
NOTE: Running task 1171 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_generate_toolchain_file)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1176 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_fetch)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1177 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 664 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1179 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1180 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_fetch)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_fetch: Started
NOTE: Running setscene task 669 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1181 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 670 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1182 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_fetch)
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1183 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_fetch)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1184 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1185 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_fetch)
NOTE: Running task 1186 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_fetch)
NOTE: Running task 1187 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_fetch)
NOTE: recipe readline-8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1188 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1189 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_fetch)
NOTE: recipe libffi-3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1190 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1191 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 1192 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_unpack)
NOTE: Running task 1193 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe gdbm-1.19-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-3.9.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1194 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_unpack)
NOTE: Running task 1195 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_patch)
NOTE: recipe binutils-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 674 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1196 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1197 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_unpack)
NOTE: recipe util-linux-2.36.2-r0: task do_fetch: Succeeded
NOTE: Running task 1198 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_unpack)
NOTE: Running task 1199 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: recipe gdbm-1.19-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1200 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_unpack: Started
NOTE: Running task 1201 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_unpack)
NOTE: recipe libpam-1.5.1-r0: task do_fetch: Started
NOTE: Running task 1202 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1203 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_unpack)
NOTE: Running task 1204 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe binutils-2.36.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: Running task 1205 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_unpack)
NOTE: Running task 1206 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe libtirpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.19-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.36.2-r0: task do_unpack: Started
NOTE: recipe python3-3.9.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.19-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1207 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_patch)
NOTE: recipe libnsl2-1.3.0-r0: task do_unpack: Started
NOTE: Running task 1208 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_patch)
NOTE: recipe libffi-3.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1209 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_patch)
NOTE: Running task 1210 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: Running task 1211 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 1212 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.1-r0: task do_unpack: Started
NOTE: recipe readline-8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1213 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_patch)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_patch: Started
NOTE: Running task 1215 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: recipe libffi-3.3-r0: task do_patch: Started
NOTE: Running task 1216 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe openssl-1.1.1k-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe readline-8.1-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e60afcef8272a2d845684867ffe0953510b7ea27963ab487206430b7961dcec
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe openssl-1.1.1k-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_unpack)
NOTE: Running task 1218 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libnsl2-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1220 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1221 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_fetch)
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 682 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1224 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1228 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_patch)
NOTE: Running task 1229 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1-r0: task do_patch: Succeeded
NOTE: Running task 1231 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_unpack)
NOTE: Running task 1232 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe ncurses-6.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpam-1.5.1-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1235 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_patch)
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: Running task 1237 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_unpack)
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 1239 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_patch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1241 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: recipe libffi-3.3-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1246 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1249 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_patch: Started
NOTE: recipe openssl-1.1.1k-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_patch)
NOTE: recipe ncurses-6.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.5-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe libpam-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1252 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_unpack)
NOTE: recipe binutils-2.36.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_patch: Started
NOTE: recipe systemd-1_247.4-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_patch)
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_patch)
NOTE: recipe util-linux-2.36.2-r0: task do_unpack: Succeeded
NOTE: Running task 1257 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_patch)
NOTE: recipe zlib-1.2.11-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1258 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: Running task 1262 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_patch: Started
NOTE: Running setscene task 686 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running noexec task 1264 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_fetch)
NOTE: recipe openssl-1.1.1k-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running noexec task 1269 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to 28b685da9b9fde476208bb9b5eb15ec2767b7ad9fdf3b386240896e5a7af53eb
NOTE: recipe ncurses-6.2-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1271 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_patch)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.2-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1273 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_fetch: Started
NOTE: Running setscene task 697 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1275 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: Running task 1276 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libgcc-initial-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_fetch: Succeeded
NOTE: Running task 1278 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 1280 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: Running task 1281 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1286 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1287 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1288 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe python3-3.9.2-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1290 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Running task 1291 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata unihash changed to 2f626d86abf9b457ba280154016bdb9ba69b67e821fdb5a5a97a441ba5e8dae4
NOTE: Running task 1292 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_unpack: Succeeded
NOTE: Running task 1293 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_patch: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 989 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 990 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1301 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.10-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1302 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_unpack)
NOTE: Running task 1303 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_unpack: Succeeded
NOTE: Running task 1304 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_symlink_kernsrc)
NOTE: recipe linux-libc-headers-5.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1305 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_checkout: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1318 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_validate_branches)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_validate_branches: Succeeded
NOTE: Running task 1319 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_metadata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1320 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_patch)
NOTE: Running task 1321 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_patch)
NOTE: recipe linux-libc-headers-5.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_patch: Succeeded
NOTE: Running noexec task 1325 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_configure)
NOTE: Running noexec task 1326 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_compile)
NOTE: Running task 1327 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_install)
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Succeeded
NOTE: Running task 1340 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package)
NOTE: Running task 1344 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configme)
NOTE: Running task 1345 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_configme: Started
NOTE: Running noexec task 1346 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1347 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1348 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1350 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1352 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_configure: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Running task 1354 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata unihash changed to 23987abbb5c8da5874955dd4cb8db9154425fc87fd7d4053d739eb074e1943a5
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Succeeded
NOTE: Running task 1356 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata unihash changed to a97f9814bc054f2595b773a932aa8192a5d4984f4bcd64530b8ade592fb13e21
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1357 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: Running task 1358 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_install: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_install: Succeeded
NOTE: Running task 1360 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1361 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package: Started
NOTE: recipe libgcc-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1362 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_configure)
NOTE: recipe libgcc-10.2.0-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1363 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_compile)
NOTE: recipe libgcc-10.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package: Succeeded
NOTE: Running task 1364 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata unihash changed to fb3f165dad901632876d5090252e51ef9780c75f000201f4873a7d17c5d5dc77
NOTE: Setscene tasks completed
NOTE: Running task 1365 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1366 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_install)
NOTE: recipe libgcc-10.2.0-r0: task do_install: Started
NOTE: recipe libgcc-10.2.0-r0: task do_install: Succeeded
NOTE: Running task 1367 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_multilib_install)
NOTE: recipe libgcc-10.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-10.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1368 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-10.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-10.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1370 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package)
NOTE: recipe libgcc-10.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1372 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_configure)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1373 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata unihash changed to 9e20401c937926b1126b6e6b9cde1264a8eeeb261dfc9da260337b6b2d322eb2
NOTE: Setscene tasks completed
NOTE: Running task 1374 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1375 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_configure)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_configure: Succeeded
NOTE: Running task 1376 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_configcheck: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1377 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_compile: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1378 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_compile)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_shared_workdir)
NOTE: Running task 1380 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_link_images)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_shared_workdir: Succeeded
NOTE: Running task 1381 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_compile_kernelmodules: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1382 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_install)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_install: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 1383 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_strip)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_strip: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_strip: Succeeded
NOTE: Running task 1384 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_sizecheck)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_sizecheck: Succeeded
NOTE: Running task 1385 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_install)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_install: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_install: Succeeded
NOTE: Running task 1386 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package)
NOTE: Running task 1387 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_bundle_initramfs)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_install: Succeeded
NOTE: Running task 1395 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1396 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1398 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1399 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1401 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1404 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package)
NOTE: Running task 1407 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1410 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1411 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1412 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1413 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1414 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1415 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1416 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1417 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1419 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Started
NOTE: Running task 1420 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1421 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1423 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1424 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1427 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1428 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1429 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure)
NOTE: recipe libffi-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1431 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1432 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.11-r0: task do_configure: Started
NOTE: Running task 1433 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe m4-1.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_configure)
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1436 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1437 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe gdbm-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1438 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_configure)
NOTE: recipe opkg-utils-0.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1439 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_configure)
NOTE: recipe libffi-3.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_configure: Started
NOTE: recipe systemd-conf-247.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: Running task 1440 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_configure)
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: Running task 1442 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libcap-ng-0.8.2-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_configure: Started
NOTE: recipe flex-2.6.4-r0: task do_configure: Started
NOTE: Running task 1443 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_configure)
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_configure)
NOTE: Running task 1445 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe gdbm-1.19-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe m4-1.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1449 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_configure)
NOTE: Running task 1450 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_configure)
NOTE: recipe mdadm-4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_configure)
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Started
NOTE: Running task 1452 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_configure)
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_configure: Started
NOTE: recipe systemd-conf-247.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1453 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_configure)
NOTE: Running noexec task 1454 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_compile)
NOTE: Running task 1455 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_configure)
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_configure)
NOTE: Running task 1458 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure)
NOTE: recipe opkg-utils-0.4.3-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_compile)
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Started
NOTE: Running task 1460 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: Running task 1461 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1462 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_configure: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_configure: Started
NOTE: Running task 1463 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 1464 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_compile)
NOTE: Running task 1465 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_configure: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe systemd-conf-247.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.1-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_install: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_configure: Started
NOTE: recipe zlib-1.2.11-r0: task do_configure: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_configure: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_configure: Succeeded
NOTE: Running task 1466 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_configure_ptest_base)
NOTE: Running task 1467 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_compile)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_compile: Started
NOTE: Running task 1468 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_compile)
NOTE: recipe opkg-utils-0.4.3-r0: task do_compile: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_configure_ptest_base: Started
NOTE: recipe systemd-conf-247.3-r0: task do_compile: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_install: Succeeded
NOTE: Running task 1469 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_install)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_compile: Succeeded
NOTE: Running task 1470 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_compile)
NOTE: Running task 1471 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_install)
NOTE: recipe mdadm-4.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_install)
NOTE: Running task 1473 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.4.3-r0: task do_install: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_install: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_compile: Succeeded
NOTE: Running task 1474 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_install)
NOTE: recipe systemd-conf-247.3-r0: task do_install: Started
NOTE: recipe mdadm-4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1475 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_compile)
NOTE: recipe opkg-utils-0.4.3-r0: task do_install: Succeeded
NOTE: Running task 1477 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1479 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1480 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1483 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_install: Started
NOTE: Running task 1485 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1486 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-conf-247.3-r0: task do_install: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_install: Succeeded
NOTE: Running task 1487 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-1.1.1k-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.1-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-1.1.1k-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1488 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_configure)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1489 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: Running task 1490 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe openssl-1.1.1k-r0: task do_configure: Started
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: Running task 1493 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe diffutils-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1495 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Succeeded
NOTE: Running task 1496 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: Running task 1497 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1498 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_configure)
NOTE: recipe ncurses-6.2-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe sed-4.8-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1499 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1500 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe findutils-4.8.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1502 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_install)
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_install)
NOTE: recipe zlib-1.2.11-r0: task do_install: Started
NOTE: recipe xorgproto-2020.1-r0: task do_install: Started
NOTE: recipe expat-2.2.10-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.11-r0: task do_install: Succeeded
NOTE: Running task 1505 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_install_ptest_base)
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1506 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile)
NOTE: recipe zlib-1.2.11-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_compile: Started
NOTE: recipe zlib-1.2.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1508 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2020.1-r0: task do_install: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_configure)
NOTE: recipe cracklib-2.9.5-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe openssl-1.1.1k-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_configure_ptest_base)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: Running task 1515 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_compile)
NOTE: recipe openssl-1.1.1k-r0: task do_configure_ptest_base: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe openssl-1.1.1k-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1517 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1519 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-1.1.1k-r0: task do_compile: Started
NOTE: Running task 1520 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1521 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: Running task 1523 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1524 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_install)
NOTE: Running task 1525 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: Running task 1528 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xkeyboard-config-2.32-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Started
NOTE: recipe mdadm-4.1-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_install)
NOTE: recipe argp-standalone-1.3-r0: task do_install: Started
NOTE: recipe argp-standalone-1.3-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1544 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_install)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1545 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1546 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe mdadm-4.1-r0: task do_install: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.2.10-r0: task do_compile: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: Running task 1547 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile_ptest_base)
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1548 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1550 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_install: Succeeded
NOTE: Running task 1551 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata unihash changed to 0b4e9540276fdd736d5b8a198edf01b155f824da7de28f0eefa3b1eef32a8c5f
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1553 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1554 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 1555 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1556 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: Running task 1557 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1558 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1559 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: Running task 1560 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: Running task 1561 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package)
NOTE: Running task 1562 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package)
NOTE: Running task 1563 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: Running task 1564 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: Running task 1565 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: Running task 1566 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: Running task 1567 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Started
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1568 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe systemd-conf-247.3-r0: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1569 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1570 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1571 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.1-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1572 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_install: Succeeded
NOTE: Running task 1574 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1575 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe musl-obstack-1.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1576 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1577 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.32-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Succeeded
NOTE: Running task 1578 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1579 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package: Succeeded
NOTE: Running task 1580 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata)
NOTE: Running task 1581 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Running task 1583 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: Running task 1584 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_compile: Succeeded
NOTE: Running task 1585 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 1b144f28ccb6fed99d8245aa0bccee3fae2580028c3469df09b00a91da32cbac
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Succeeded
NOTE: Running task 1586 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: Running task 1587 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Running task 1588 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: Running task 1589 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_install: Started
NOTE: Running task 1590 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata unihash changed to 8687e05ec0e615a9affee385b56eee96b93a976de25625e14665cbf0a949a908
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: Running task 1591 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata unihash changed to 123e88c5c507e15d3ad1554b6237bba9f53b19124390fbf3418b4653d5445b37
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata unihash changed to 216042567485f81132f8cb0755dfbb0006015d49f92c5b2dd1aa00db8d6b5023
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata unihash changed to d33f7bedc4d7d04614bb241410ccbda2f13c70ea398ec90b632aefd73fcc72ad
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata unihash changed to e3ba1029487410abe8a7d8035891bd669b5d39a9e05ad7ea7115766b2d3ee83e
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata unihash changed to 069e176b42cc4cb192ecfa7f348ddf5d88799dc429f4410b64da8e43cb1f3e46
NOTE: Running task 1592 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1593 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: Running task 1594 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_compile)
NOTE: Running task 1595 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: Running task 1596 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm)
NOTE: Running task 1597 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: Running task 1598 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm)
NOTE: Running task 1599 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: Running task 1600 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to a80e3a3619d6413e10c60cc25df8b84a11833916f119727e5d49f147496382cf
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata unihash changed to ac2706083222de1b85f5f322635c6d1427f23c2f5df60689b1f74d619c7b6ff8
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata unihash changed to a95d665eaac2aebf721f3271828af30695986926ec92cbac43998c3d272bd63e
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata unihash changed to b7c90d022fbaa1e90782c4815aa0c9f15af07a2542ec0feeab766278e6201c02
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata unihash changed to bd1170f371f2cc04e537f96e93fd6994cb60f1d8332afa478884737290044fab
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: Running task 1604 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: Running task 1605 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: Running task 1606 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: Running task 1607 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: Running task 1609 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_package: Succeeded
NOTE: Running task 1610 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: Running task 1611 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.183-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: Running task 1614 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_compile: Started
NOTE: Running task 1615 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_install)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to 0e239b7a492f3ea87ab617590067a6e1b0fbecd7e617a4e3ffd26cf63eabf554
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1617 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_install: Started
NOTE: Running task 1618 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_configure)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1619 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.183-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1620 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1621 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: Running task 1623 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1625 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata unihash changed to f289382e6cff68ab85869f0e8020396156070ae4663658c85e1d9e6cdc57690d
NOTE: Setscene tasks completed
NOTE: Running task 1626 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_configure: Succeeded
NOTE: recipe kmod-28-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1627 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1628 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_install: Succeeded
NOTE: Running task 1632 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package)
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_compile: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: Running task 1633 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: Running task 1634 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_install)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Started
NOTE: Running task 1635 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_install: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata unihash changed to bf6953d3d7a86a393e34a7d31b2ebbf88fbfb0e835689dc4102d1420ab743ee6
NOTE: Setscene tasks completed
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1636 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1637 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1638 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: Running task 1640 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1641 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe libpcre-8.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1642 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: Running task 1644 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1645 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package)
NOTE: Running task 1646 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe openssl-1.1.1k-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_compile_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1648 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_install)
NOTE: recipe libnsl2-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Started
NOTE: Running task 1649 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_configure)
NOTE: recipe openssl-1.1.1k-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-1.1.1k-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_install: Started
NOTE: Running task 1650 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_install)
NOTE: recipe libpcre-8.44-r0: task do_configure: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.3-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1652 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_compile)
NOTE: Running task 1653 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Running task 1654 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_compile)
NOTE: recipe libnsl2-1.3.0-r0: task do_configure: Started
NOTE: recipe openssl-1.1.1k-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1655 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe gdbm-1.19-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.3-r0: task do_compile: Started
NOTE: Running task 1656 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_configure_ptest_base)
NOTE: Running task 1657 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata unihash changed to 8032c9ee317dbc18a41d3a73951b9dacf8182499176d36915f1a4c6ce5a8c09c
NOTE: Running task 1658 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata unihash changed to 19d31ff2c7e5dcde7056baaa0021126fe7c8c99cae733a4e5a97c4ce37877c2c
NOTE: recipe gdbm-1.19-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1659 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1660 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_compile)
NOTE: Running task 1661 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1663 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 1665 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package)
NOTE: recipe cracklib-2.9.5-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_compile)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata unihash changed to 4626d5553863fe6a3307fad17ee4650a9a4fd13207902d915ecdb046dee93253
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to 1991de0cc2ac421c86ccd43354745f546a28895e055ae0bfe92e0b73087d679a
NOTE: recipe cracklib-2.9.5-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1667 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 1668 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe libffi-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_install)
NOTE: recipe libffi-3.3-r0: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata unihash changed to 48f3834aa398bd0583671e4b813d2086a74bc704f353874cc59ee08e01d7f597
NOTE: Setscene tasks completed
NOTE: Running task 1670 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1671 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe cracklib-2.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe make-4.3-r0: task do_compile: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1674 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1676 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1677 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_compile_ptest_base)
NOTE: recipe libffi-3.3-r0: task do_install: Succeeded
NOTE: Running task 1679 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: Running task 1680 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: Running task 1681 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1683 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: recipe acl-2.2.53-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe make-4.3-r0: task do_install: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: Running task 1684 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_configure: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1685 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure_ptest_base)
NOTE: Running task 1686 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_configure)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.2.53-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1688 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Succeeded
NOTE: Running task 1690 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: Running task 1691 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: Running task 1692 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1693 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata unihash changed to 553d3b4921e78e15b091c92361940464dba4d06caf53798f24cb98f85b758fdc
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: recipe make-4.3-r0: task do_install: Succeeded
NOTE: Running task 1696 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1697 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata)
NOTE: Running task 1698 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Running task 1699 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: Running task 1700 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: Running task 1701 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: Running task 1702 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1703 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1704 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata unihash changed to 4254fb434b0b7ebc0741470497371116e4f7345b124e7a8b266e5777f0abf064
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata unihash changed to 1c29b9d7fe2b6bbe2fd49310ac928b9c5f8360618550909167e5e4c9e14d580f
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata unihash changed to a8ce3b60dd5c1a86ee1bd2a5ea25e1d72e68b53a48448cb908fc3a2c8645980a
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata unihash changed to af6defdfa6e8ef180a68817d68f9f7b066f9104cde27a38b1d9934e6eba25838
NOTE: recipe m4-1.4.18-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile_ptest_base)
NOTE: Running task 1707 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_compile)
NOTE: Running task 1708 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_install)
NOTE: Running task 1709 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_compile)
NOTE: Running task 1710 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: Running task 1711 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_install_ptest_base)
NOTE: Running task 1712 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: Running task 1713 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: Running task 1714 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: Running task 1715 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: Running task 1716 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: Running task 1717 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: Running task 1718 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_configure_ptest_base)
NOTE: Running task 1719 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_configure: Succeeded
NOTE: Running task 1720 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1721 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_compile: Started
NOTE: recipe xz-5.2.5-r0: task do_compile: Started
NOTE: Running task 1722 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: Running task 1723 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: recipe libnsl2-1.3.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: Running task 1724 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_configure_ptest_base)
NOTE: Running task 1725 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe gdbm-1.19-r0: task do_install: Started
NOTE: recipe openssl-1.1.1k-r0: task do_install_ptest_base: Started
NOTE: Running task 1726 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata)
NOTE: Running task 1727 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: Running task 1729 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: Running task 1731 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm)
NOTE: recipe elfutils-0.183-r0: task do_configure_ptest_base: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe m4-1.4.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1732 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_compile)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: Running task 1733 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1734 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: Running task 1735 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1736 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile)
NOTE: recipe elfutils-0.183-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe diffutils-3.7-r0: task do_configure_ptest_base: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_compile: Started
NOTE: recipe diffutils-3.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1737 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: recipe sed-4.8-r0: task do_compile: Started
NOTE: Running task 1738 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe diffutils-3.7-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1739 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata unihash changed to 7d63e7e361af4756fc17126fb2491b0908f9bfe569c08bf6f5d3aeff8cf44fe6
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata unihash changed to a9eef2c674ea8c4363d5d89cf9287f8dc7bb087cb217129dce8db94b9925aa69
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata unihash changed to a2bd19674855c1232992ca344db77bf32cf88d715c2a142952b77efebddf4db2
NOTE: recipe libnsl2-1.3.0-r0: task do_compile: Succeeded
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_install)
NOTE: recipe openssl-1.1.1k-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1741 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: Running task 1742 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: Running task 1744 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package)
NOTE: Running task 1745 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 1746 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Started
NOTE: recipe kmod-28-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_install: Started
NOTE: Running task 1747 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1748 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata unihash changed to 2773054fae5b67e9d85ba1e200706f721b180ee66e3834a8c119dbee1c7ac925
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe kmod-28-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1752 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: Running task 1753 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1755 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1756 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata unihash changed to da01fad75cdebdb5294e42fabfc64123bca0f113c7a05a0baf1ecd4e9abf89d5
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata unihash changed to 2f3c28195ef0cdafed8a0485c42a8a0a7604de0a0f3f64915a58f07280163efc
NOTE: Running task 1757 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: Running task 1758 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: Running task 1759 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 1761 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_install: Succeeded
NOTE: Running task 1763 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_install_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1765 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe gdbm-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe gdbm-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1767 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_package: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: Running task 1768 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_install: Succeeded
NOTE: Running task 1770 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1771 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe xz-5.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_install)
NOTE: recipe xz-5.2.5-r0: task do_install: Started
NOTE: recipe acl-2.2.53-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1773 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_configure_ptest_base)
NOTE: Running task 1774 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1775 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: recipe sed-4.8-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe kmod-28-r0: task do_compile: Succeeded
NOTE: Running task 1778 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: Running task 1779 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.2.53-r0: task do_compile: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1780 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1781 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_install: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: Running task 1782 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install)
NOTE: recipe m4-1.4.18-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.8-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata unihash changed to 74a7da07dc6101cfd5fb7988bc3fcf75e3c16c8abf90dbd8d6a7c9d3ae5af5d2
NOTE: Running task 1784 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: recipe libpcre-8.44-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_configure_ptest_base)
NOTE: recipe m4-1.4.18-r0: task do_compile_ptest_base: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata unihash changed to 5d8f529a851a781c58bd60d9d287080c339d7c71482e9714ece28bf4e6d832c8
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: Running task 1786 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
NOTE: recipe libpcre-8.44-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.44-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_compile)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata unihash changed to 70f45bbd7b6bfbf54b8922f99c09bfd561aa9fbd865f4a4598f2373f4b540439
NOTE: recipe libpcre-8.44-r0: task do_compile: Started
NOTE: recipe kmod-28-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata unihash changed to 0d2a7363ea399edd0a7f4c5b51363f07022f23cd91a5a3cbc86795ea898a73cf
NOTE: Running task 1789 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: Running task 1790 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 1791 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 1792 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: Running task 1793 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe diffutils-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1794 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: Running task 1795 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1796 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_install)
NOTE: recipe acl-2.2.53-r0: task do_compile: Succeeded
NOTE: Running task 1797 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.7-r0: task do_install: Started
NOTE: recipe acl-2.2.53-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata unihash changed to ebe452d17b7eb9c9d97eea702e2dd142b7ccf96289339db9d29298e8b802ccb7
NOTE: recipe xz-5.2.5-r0: task do_install: Succeeded
NOTE: Running task 1799 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: Running task 1800 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1801 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm)
NOTE: recipe acl-2.2.53-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1802 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_install)
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_install: Succeeded
NOTE: Running task 1803 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install_ptest_base)
NOTE: recipe acl-2.2.53-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata unihash changed to a6fa76c023bcc30a1a53b76b3cf842ca0aa20bd6815e0c4ee733d490d5719fe7
NOTE: Running task 1804 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package: Succeeded
NOTE: Running task 1805 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: Running task 1808 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1809 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe perl-5.32.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-28-r0: task do_package: Succeeded
NOTE: Running task 1810 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe perl-5.32.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_configure)
NOTE: recipe kmod-28-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_compile)
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe perl-5.32.1-r0: task do_configure: Started
NOTE: recipe diffutils-3.7-r0: task do_install: Succeeded
NOTE: Running task 1814 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.2-r0: task do_compile: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_install: Succeeded
NOTE: Running task 1815 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_install_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_install_ptest_base: Started
NOTE: Running task 1816 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_install_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1817 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata unihash changed to c15162f871a632475b1660566e0fe7f31834f0e2a3f40da32e4e4fe58b63715f
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to ffd138aab009270eb2e75828254a70e552836b9cd63ab024d0b32cc5be707700
NOTE: recipe acl-2.2.53-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1819 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: Running task 1820 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1821 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1823 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata unihash changed to 588c781ebe6afc46feb6f2ac1fd499d0c9fb8f81689e014e6f0eaab22ec1c830
NOTE: Running task 1824 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1826 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Running task 1827 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata unihash changed to 6d5c165994e22fa13831cacb8243e3bbbc7a951e5e82b118510b0c0e8fbc0719
NOTE: Running task 1828 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 1829 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 1830 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 1831 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata unihash changed to 9d0a4b6ed616e877271eda4a9e0ae7079fb6edb0630c9512087186b7a5742ba5
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata unihash changed to da88e1652dd9746a051b4df99409c67928ba656cedab81ff36e48e75f06d2625
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy became valid
NOTE: Running setscene task 3429 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running task 1832 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: Running task 1833 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1834 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata unihash changed to a86d3effe5593e2636f3bcbd5903de235406024a14014c6fbc9380b8aff8dfdd
NOTE: Running task 1835 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1837 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata unihash changed to 68b00533f0b6ac714b19cb1e8d24b163933cb823d6e9c555d7b3ff1dc9b5f74f
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata unihash changed to 8697b0419994cf10c8bece6aef689aba9ea0c1ffcc089dd40161969fe17b0723
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata unihash changed to b1c41f3a56fa950eef3529b9700ec59d60e972c1b16d98ff51a82b530261850a
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1840 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe findutils-4.8.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe findutils-4.8.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.44-r0: task do_compile: Succeeded
NOTE: Running task 1842 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1844 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libpcre-8.44-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.44-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1845 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_install: Succeeded
NOTE: Running task 1846 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.44-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.44-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1848 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: Running task 1849 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1850 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1851 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1852 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_compile)
NOTE: recipe bison-3.7.5-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata unihash changed to e72b326976f275d302757b58ed7575192523d21cdf62207eb30f813038e9feaa
NOTE: Setscene tasks completed
NOTE: Running task 1854 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe ncurses-6.2-r0: task do_compile: Succeeded
NOTE: Running task 1855 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_install)
NOTE: recipe ncurses-6.2-r0: task do_install: Started
NOTE: recipe elfutils-0.183-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1857 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_install)
NOTE: recipe bison-3.7.5-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 1859 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata unihash changed to 84be132f1c5c347bfbb3f8bfa0edb13461670474618b406bb3e04693438f1027
NOTE: Setscene tasks completed
NOTE: Running task 1860 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe findutils-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1863 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.8.0-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1865 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.0-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 1867 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_install: Succeeded
NOTE: Running task 1869 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package)
NOTE: recipe bison-3.7.5-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1871 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 1872 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 1873 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe findutils-4.8.0-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Started
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe bison-3.7.5-r0: task do_package: Succeeded
NOTE: Running task 1874 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata)
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Started
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata unihash changed to c8b817d836570c3182533262a841a9e5250fe3bc6db104d7454914f58fc10eae
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata unihash changed to be69bfcbc70963a06734d05576cca9a43773458093969c40722e9c5ef0dc9896
NOTE: Running task 1875 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: Running task 1876 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 1877 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata unihash changed to 16e42c0fc990faafd0202ae668e2853a4ee897c7904c5b6b9260930552da493c
NOTE: Setscene tasks completed
NOTE: Running task 1878 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata unihash changed to f500aae45f35b3ac3c4358a668ccf1e4797bcdc92a5907fb6a3dcbebb0059c2d
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1880 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_install)
NOTE: recipe elfutils-0.183-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.183-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.183-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1882 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1884 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1887 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: Running task 1888 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: recipe bash-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe m4-1.4.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1889 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_install)
NOTE: recipe readline-8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1890 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_configure)
NOTE: recipe m4-1.4.18-r0: task do_install: Started
NOTE: recipe bash-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_configure)
NOTE: recipe readline-8.1-r0: task do_configure: Started
NOTE: recipe bash-5.1-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata unihash changed to aa36765ffca3fad3236a412cddfac38a38babe421e68e38294d7f337f09aa476
NOTE: Setscene tasks completed
NOTE: Running task 1893 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_install: Succeeded
NOTE: Running task 1894 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_install_ptest_base)
NOTE: recipe libx11-1_1.7.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1895 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_compile)
NOTE: recipe m4-1.4.18-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_install)
NOTE: recipe m4-1.4.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1897 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_install: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_install: Succeeded
NOTE: Running task 1899 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Succeeded
NOTE: Running task 1900 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata unihash changed to 539f0ef61113d8d6b38401e6b2e105bb06505fa449a9abde39071a707d4dd86e
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1903 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe readline-8.1-r0: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_compile)
NOTE: recipe grep-3.6-r0: task do_compile: Started
NOTE: recipe readline-8.1-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_install)
NOTE: recipe readline-8.1-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 1906 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe readline-8.1-r0: task do_install: Succeeded
NOTE: Running task 1908 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1909 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1911 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1912 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure)
NOTE: recipe socat-1.7.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1913 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.1-r0: task do_configure: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Succeeded
NOTE: Running task 1914 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_install)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_install: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Running task 1916 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 1917 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata unihash changed to 6c0ee78f9c08e3b0eb235b8416d0f4142dc1f668944f30b2939f34d62f405b77
NOTE: Setscene tasks completed
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.6-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_install)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.6-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata unihash changed to 5a6faeeccee7aca95bad90d271c9386cddb4784c03ff15f32b0353c5ea021cf2
NOTE: Setscene tasks completed
NOTE: Running task 1920 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 1921 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1923 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package)
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_install: Succeeded
NOTE: Running task 1924 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: Running task 1925 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata unihash changed to 909dd5a47c71cec6c62f2fc58920b407cb5a93ca3e2772e3f368cbe4d11d796c
NOTE: Setscene tasks completed
NOTE: Running task 1926 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package)
NOTE: Running task 1927 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.1-r0: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1928 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 1929 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe bash-5.1-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe readline-8.1-r0: task do_package: Succeeded
NOTE: Running task 1931 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1932 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_compile)
NOTE: recipe bash-5.1-r0: task do_compile: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata unihash changed to 0d2d15d50f800a16f822e22296f422adcfe48b9df0375499ecf785e6950d7a41
NOTE: Running task 1934 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata unihash changed to a4cea805f28395f5ce7e3cdd503e60be99523152c1ffe51d68686a091c5d0410
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1936 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1937 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install)
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1938 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata unihash changed to 5b135761e61e854ebe40d2413be4a38490e3181a2d21912c961a1ab50a47302f
NOTE: Setscene tasks completed
NOTE: Running task 1939 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1940 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1941 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1943 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1944 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1945 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe libpam-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_configure)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1947 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata unihash changed to 59e3d4bc58ceb459bc2f48cb6d45fa8e9e333c34d17304a6d91e37493f778d15
NOTE: Setscene tasks completed
NOTE: Running task 1948 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1949 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1-r0: task do_compile: Succeeded
NOTE: Running task 1950 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_compile_ptest_base)
NOTE: recipe perl-5.32.1-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.32.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1951 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_compile)
NOTE: recipe bash-5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.32.1-r0: task do_compile: Started
NOTE: recipe bash-5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1952 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_install)
NOTE: recipe binutils-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_compile)
NOTE: recipe binutils-2.36.1-r0: task do_compile: Started
NOTE: recipe bash-5.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_install: Succeeded
NOTE: Running task 1954 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_install_ptest_base)
NOTE: recipe bash-5.1-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1955 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package)
NOTE: recipe bash-5.1-r0: task do_package: Started
NOTE: recipe socat-1.7.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1956 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_compile)
NOTE: recipe socat-1.7.4.1-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_install)
NOTE: recipe socat-1.7.4.1-r0: task do_install: Started
NOTE: recipe socat-1.7.4.1-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package)
NOTE: recipe socat-1.7.4.1-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure_ptest_base)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata unihash changed to 5835b92849306503d2096b79d5b043f5b9e69dea74d5c038469d7469bd03d91e
NOTE: Setscene tasks completed
NOTE: Running task 1962 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1963 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile: Started
NOTE: recipe bash-5.1-r0: task do_package: Succeeded
NOTE: Running task 1964 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_packagedata: Started
NOTE: recipe bash-5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1965 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm)
NOTE: Running task 1966 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: Running task 1967 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1968 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1969 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1970 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install)
NOTE: recipe gawk-5.1.0-r0: task do_install: Started
NOTE: recipe libpam-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1972 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_compile)
NOTE: recipe libpam-1.5.1-r0: task do_compile: Started
NOTE: recipe gawk-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1973 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1974 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1976 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: Running task 1977 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpam-1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1978 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_compile_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1979 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_install)
NOTE: recipe libpam-1.5.1-r0: task do_install: Started
NOTE: recipe libpam-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1980 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1982 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1983 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1985 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package)
NOTE: Running task 1986 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.36.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.5.1-r0: task do_package: Started
NOTE: recipe libcap-2.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1987 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_configure)
NOTE: recipe shadow-4.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1988 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_configure)
NOTE: recipe kbd-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1989 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_configure)
NOTE: recipe libcap-2.48-r0: task do_configure: Started
NOTE: recipe util-linux-2.36.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_configure)
NOTE: recipe shadow-4.8.1-r0: task do_configure: Started
NOTE: recipe kbd-2.4.0-r0: task do_configure: Started
NOTE: recipe libcap-2.48-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_compile)
NOTE: recipe util-linux-2.36.2-r0: task do_configure: Started
NOTE: recipe libcap-2.48-r0: task do_compile: Started
NOTE: recipe libcap-2.48-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_install)
NOTE: recipe libcap-2.48-r0: task do_install: Started
NOTE: recipe libcap-2.48-r0: task do_install: Succeeded
NOTE: Running task 1994 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1995 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1996 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-8.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1997 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1998 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1999 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_configure)
NOTE: recipe coreutils-8.32-r0: task do_configure: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe libpam-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata unihash changed to 4e6011be20f1366d89e18cf9e8df24442559a65fd54676d2bfaa3d8137a60851
NOTE: Setscene tasks completed
NOTE: Running task 2002 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package)
NOTE: recipe libcap-2.48-r0: task do_package: Started
NOTE: recipe libcap-2.48-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata unihash changed to 5e21fde967c80e2bbe1e483429e26c0a5cd3c4253f0764ac046a383f50133399
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2005 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_compile)
NOTE: recipe kbd-2.4.0-r0: task do_compile: Started
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2006 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe shadow-4.8.1-r0: task do_configure: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2007 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_compile)
NOTE: Running task 2008 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe shadow-4.8.1-r0: task do_compile: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_install)
NOTE: recipe shadow-4.8.1-r0: task do_install: Started
NOTE: recipe kbd-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2010 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_install)
NOTE: recipe kbd-2.4.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2011 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2012 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to 92289ffec9e4cd2b7712f7db093b10be2ca94d687c7f745db975c3cf4f7ec320
NOTE: Setscene tasks completed
NOTE: Running task 2013 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package)
NOTE: recipe kbd-2.4.0-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2017 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.36.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.36.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2018 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_compile)
NOTE: recipe util-linux-2.36.2-r0: task do_compile: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata unihash changed to ea301d6e15abcd6a3ef9dbce703dd636c249f4cab5fe5d3b31a6b7ab1dcb2509
NOTE: Setscene tasks completed
NOTE: recipe perl-5.32.1-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_compile_ptest_base)
NOTE: recipe perl-5.32.1-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.32.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_install)
NOTE: Running task 2022 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.1-r0: task do_install: Started
NOTE: recipe util-linux-2.36.2-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.36.2-r0: task do_compile_ptest_base: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata unihash changed to 4d91a652863c4ea9a29a0fa59852f9dc73cf2be43e9594ff4574aad78e705e98
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2026 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata unihash changed to f557331d04fc8b8af2d0f210a32595331a09f54248a5d72bc4fec86080c6a8da
NOTE: Setscene tasks completed
NOTE: Running task 2029 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 2030 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_install)
NOTE: recipe binutils-2.36.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 2031 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2032 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_install)
NOTE: recipe util-linux-2.36.2-r0: task do_install: Started
NOTE: recipe coreutils-8.32-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2033 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_configure_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2034 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_compile)
NOTE: recipe coreutils-8.32-r0: task do_compile: Started
NOTE: recipe util-linux-2.36.2-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.36.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.36.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2037 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2038 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package)
NOTE: Running task 2039 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2040 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Started
NOTE: recipe python3-3.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_configure)
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2042 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_configure: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to a4afd288d408d9125ae5074b349353dbdbcdf6ae1ce6a6a166cb7b21e88f3c6e
NOTE: Setscene tasks completed
NOTE: Running task 2043 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_compile: Succeeded
NOTE: Running task 2044 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_compile_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2045 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_install)
NOTE: recipe coreutils-8.32-r0: task do_install: Started
NOTE: recipe coreutils-8.32-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_install_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2047 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Succeeded
NOTE: Running task 2048 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2049 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 2050 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2051 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile_ptest_base)
NOTE: recipe perl-5.32.1-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2054 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2057 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package)
NOTE: recipe python3-3.9.2-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2059 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_compile)
NOTE: recipe python3-3.9.2-r0: task do_compile: Started
NOTE: recipe perl-5.32.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2061 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2066 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2068 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2069 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: Running task 2070 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 2071 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2072 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2073 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2075 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2077 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_install)
NOTE: recipe python3-3.9.2-r0: task do_install: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Succeeded
NOTE: Running task 2078 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata)
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_install_ptest_base)
NOTE: recipe python3-3.9.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2081 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2082 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package)
NOTE: recipe libxml2-2.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2083 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_configure: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata unihash changed to ba7ab0c922de676d4a7f8cf50f4bac6ee992308f479ebc02e53483931385967b
NOTE: Setscene tasks completed
NOTE: Running task 2084 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2085 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 2086 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: Running task 2087 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2088 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2089 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2090 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm)
NOTE: Running task 2091 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2092 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 55aabdafc9163bfb131584321af958df378814b4296f4ef118735a90898952f8
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2094 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2095 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package: Succeeded
NOTE: Running task 2096 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2097 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.10-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2098 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: Running task 2099 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: Running task 2100 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2101 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_install)
NOTE: recipe libxml2-2.9.10-r0: task do_install: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_install: Succeeded
NOTE: Running task 2102 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2104 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2105 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2106 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2108 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: recipe wayland-1.19.0-r0: task do_compile: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2109 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2110 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2111 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2113 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2114 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_configure)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_install)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 2118 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2119 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_configure)
NOTE: recipe systemd-1_247.4-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2120 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_configure: Succeeded
NOTE: Running task 2121 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_compile)
NOTE: recipe systemd-1_247.4-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata unihash changed to 03d4ef0929db19074a3e24eafe09cf67cb55110dfcbe6d59483a8590d9be1320
NOTE: Setscene tasks completed
NOTE: Running task 2122 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2123 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2124 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 5c189b5b715de42be7ef6620135ec8cd20c2c4b38a6388c6cb95e0ff01ce2d86
NOTE: Setscene tasks completed
NOTE: Running task 2125 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2126 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2127 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_install)
NOTE: recipe systemd-1_247.4-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2128 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to c936dda55153d69b6160166482da9d07d372ba89c8708259e2d4cea8e11ed94c
NOTE: Setscene tasks completed
NOTE: Running task 2129 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2131 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2132 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: Running task 2133 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2135 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2136 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2139 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to ce699cab1e2848deba94f2586524c99678124e48e24ed8622e4bb493715c3aba
NOTE: Setscene tasks completed
NOTE: Running task 2141 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2142 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2143 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2144 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to 0d6d2f3f3ed9041360c68144334f243beef21fa7b7e9401390a2cca0ff6dfc0e
NOTE: Setscene tasks completed
NOTE: Running task 2145 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2147 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2148 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to bad5567d7b87ecd064ada13722ac2f650241c7156d18bd58f5cd407a182bc4b8
NOTE: Setscene tasks completed
NOTE: Running task 2149 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm)
NOTE: Running task 2150 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2151 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2152 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2153 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2155 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2156 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: Running task 2157 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2159 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 6856c81ed418d05edccc0f10a4cc8c89524ad32beed3e7d214f7210e48529836
NOTE: Setscene tasks completed
NOTE: Running task 2161 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2162 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2163 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Succeeded
NOTE: Running task 2165 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2166 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Succeeded
NOTE: Running task 2167 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2169 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2170 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: Running task 2171 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2172 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2174 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: Running task 2175 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2176 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2177 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2178 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 2182 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2187 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to b492fe939b19b8a470208137653af3182110d590f2e06a039f38e1f3050abb69
NOTE: Setscene tasks completed
NOTE: Running task 2189 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2193 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 0ee0c85275724cba1aa0ce0792b5435dd6aee3c55538c94261e835f22136a2e9
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2195 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2197 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2198 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2199 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2200 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 65707635063419711118176bad4c408938794e15667b8262f8ff73fdcfcfda56
NOTE: Setscene tasks completed
NOTE: Running task 2201 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2202 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2203 of 2203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2203 tasks of which 1064 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message shown.
Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4180759231048520356==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54431528748b0dbe84617a558403c4bfc52e6523"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 310 Local 5 Network 0 Missed 305 Current 378 (1% match, 55% complete)
Removing 180 stale sstate objects for arch mips32r2...done.
Removing 109 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 452 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_stash_locale_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 237 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_fetch)
NOTE: Running task 992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Succeeded
NOTE: Running noexec task 993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_configure)
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_compile)
NOTE: Running task 995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_install)
NOTE: Running task 1000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_unpack)
NOTE: Running task 1002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_fetch)
NOTE: Running task 1054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1262 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: Running task 1263 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_unpack)
NOTE: Running task 1306 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: Running task 1307 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_patch: Started
NOTE: Running task 1311 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1313 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: Running task 1315 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata unihash changed to f9d85847473bfe9be1140b32efa503d4e8cdc512b98fe300dba13c66dbb612b6
NOTE: Running task 1317 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata unihash changed to 083dd7beee448837514f9abf4d407e81811f0fe0627dd71522df38fbee95b39e
NOTE: Setscene tasks completed
NOTE: Running task 1318 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1319 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1321 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b85e8f5187c4407294df3a7ad33f6197016437788e9cbe0e1684edcfd6f1d00
NOTE: Running task 1322 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic unihash changed to 777e4cd387d5e4bda3d55a8ce4020b5bc41fab7d890f9993bf1189d0944351f7
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Succeeded
NOTE: Running task 1337 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to d6ecd22b13d3ba7049c0ade5bfa0a3dacace76da45dfcade1e275edbadffd93a
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1353 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_configure)
NOTE: recipe glibc-2.33-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Succeeded
NOTE: Running task 1354 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata unihash changed to 07af452028d359fbd2d51d14324100ad45743f94bcd8b1d9843b6209070db8bf
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-2.33-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_compile)
NOTE: recipe glibc-2.33-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_package: Succeeded
NOTE: Running task 1357 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata unihash changed to 71bc1b323f09bd14ff58a9353f3c748c63cb62a705b7cf9ab5b13687bc9ee847
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy became valid
NOTE: Running setscene task 980 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running task 1358 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_deploy_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_7f1f1ad2f2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_install)
NOTE: recipe glibc-2.33-r0: task do_install: Started
NOTE: recipe glibc-2.33-r0: task do_install: Succeeded
NOTE: Running task 1517 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package)
NOTE: Running task 1684 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1752 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_configure)
NOTE: Running task 1870 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure)
NOTE: recipe bison-3.7.5-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Started
NOTE: recipe glibc-2.33-r0: task do_package: Succeeded
NOTE: Running task 1872 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata)
NOTE: recipe glibc-2.33-r0: task do_packagedata: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata unihash changed to 4d4acd0c3a30e81074a19a18aa1ff959f864690eb01038902e1997cb2fb26782
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package)
NOTE: Running task 1874 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package)
NOTE: Running task 1875 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm)
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Started
NOTE: recipe glibc-locale-2.33-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1876 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1877 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata unihash changed to a07458fed326d38c6abf5b90676ec4873d6c0046d8bfc319d01331c870ab0c35
NOTE: Setscene tasks completed
NOTE: Running task 1878 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package)
NOTE: Running task 1879 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1882 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 1884 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1885 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata unihash changed to 38e0a4fe51983dc7affd62e82d3a12895fd79d9fc63c3dfeba62cac446df5e0f
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: Running task 1888 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: Running task 1889 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package)
NOTE: Running task 1890 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1891 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1892 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: Running task 1893 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 1894 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package)
NOTE: Running task 1895 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package)
NOTE: Running task 1896 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package)
NOTE: Running task 1897 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: Running task 1898 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package)
NOTE: Running task 1899 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1900 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1901 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: Running task 1902 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package)
NOTE: Running task 1903 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: Running task 1904 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package)
NOTE: Running task 1905 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: Running task 1906 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1907 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: Running task 1908 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: Running task 1909 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 1910 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: Running task 1911 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: Running task 1912 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: Running task 1913 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package)
NOTE: Running task 1914 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Started
NOTE: Running task 1915 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package)
NOTE: Running task 1916 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Started
NOTE: Running task 1917 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Running task 1918 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_package: Succeeded
NOTE: Running task 1919 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Succeeded
NOTE: Running task 1920 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1921 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Succeeded
NOTE: Running task 1922 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 1923 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1924 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata unihash changed to 967516dae472261ae211398b6cc3c97399904dd1a2fc419cad41c98e1a066caa
NOTE: Running task 1925 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata unihash changed to 11929d4d9324713a19d8df49439e1598353b13b5a3a544390ee9d7376d7f3897
NOTE: Running task 1926 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata unihash changed to 1e36b0a2192ba98ccfef10c0a36e548971b4dd9fe74d969fdcfb7ce03f740fd9
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata unihash changed to 800f4698ea1d6949c3ccdee29802a4c0b17d66ccee6a3371405bacbd2c3a7448
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata unihash changed to 9ee35bcfc396adb75eb9f5f8389b14c356c2fae2c1834693c27cf4eab109744d
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1927 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: Running task 1928 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package)
NOTE: Running task 1929 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: Running task 1930 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm)
NOTE: Running task 1931 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm)
NOTE: Running task 1932 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: Running task 1933 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm)
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Running task 1934 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata unihash changed to 2d7a779b6c98d2776bd6bdfa933a5437a8363fee2765d8947cc06073e42d7c7d
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata unihash changed to 527559e3c7b53222db3b9890c896926c6f90694ddb77bd85aa75c4b00cc111e9
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1935 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: Running task 1936 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: Running task 1937 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: Running task 1938 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Running task 1939 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: Running task 1940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: Running task 1941 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata unihash changed to c3a596155c97d5c9d23d85d066d2a851e2762c739d61328a9c3f7a8256e2314d
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 1942 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata)
NOTE: Running task 1943 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata unihash changed to 3222bb73ee2f354378e7e37e94c924f34984e9f835bea4f4c641546e4bd67d6d
NOTE: Running task 1944 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Succeeded
NOTE: Running task 1945 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata unihash changed to 1577aa0a27a594e97b0dd9ba3fd89e74a47387f921297f15bd60982e3fcb9450
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1946 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to d67b83942987738eabf4ee08568caa890daf47fa3391df3f13af392bb8088909
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1947 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata unihash changed to 68c4ecdfd1c94d33dd3b454809ee37f70aaa79d5b0358d95e13991c7629d0393
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata unihash changed to 80525215bf6e6a7f2e4ef367f2583d99e9d1d46a16e7a77e836ae9c03575e7ac
NOTE: Running task 1948 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: Running task 1949 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1950 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: Running task 1951 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1952 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1953 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1954 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to d462c12da3ead60b7e527a7b9acc1483b56290ee8ce8c2da605eee5f5c4e1df9
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: Running task 1955 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata unihash changed to 3d97fb1904f7cb86a72dc6805bcc2c91d53ba25235a22f25467a1484015fcdbd
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Started
NOTE: Running task 1956 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1957 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: Running task 1958 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: Running task 1959 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: Running task 1960 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: Running task 1961 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: Running task 1962 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package)
NOTE: Running task 1963 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: Running task 1964 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: Running task 1965 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: Running task 1966 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm)
NOTE: Running task 1967 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata unihash changed to cfa3e58281a5e9b6097fd3457aab2cee002c3a6be4a51b93fd50e066f743bf26
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1968 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata unihash changed to 74841d394d2ac23d3d8c69023f3dd496533bcc56449c7ca9a4571722aa0f047a
NOTE: recipe findutils-4.8.0-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Running task 1969 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: Running task 1970 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to ea60e8dca5e82f0bac340d03fd90753d5554e3c9768089236347bd42ee8b6db7
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1971 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Succeeded
NOTE: Running task 1972 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1973 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata unihash changed to 16d84c5a8338baf63f70d05bbb8d648192343eace67e1091adfc00efdad3ddb4
NOTE: Setscene tasks completed
NOTE: Running task 1974 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1976 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1977 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata unihash changed to 18794ce0e13d3fa696de8099a3d4bb34edb9473247d0ce2b89aa398f4fdb7050
NOTE: Running task 1978 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: Running task 1979 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata unihash changed to fa735e929dda819a3cf90b75e8b2134128a41b497320be47090c8a7044eb2b6d
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata unihash changed to 5a3e46316bc6b859a306dafef65dacb8823597b238ac38ac6f5a5c8b647bbe88
NOTE: Running task 1980 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: Running task 1981 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1982 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata unihash changed to 68c05b2e7d1d0474003d5662d67338da562993d0e64955dc2d2afa6f0e291ffb
NOTE: Running task 1983 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: Running task 1984 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1985 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata unihash changed to 301b88e0a1698ecf099d2ce17766b07c260e291e867a6a828de974a1bd1815c1
NOTE: Running task 1986 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1987 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe gdbm-1.19-r0: task do_package: Succeeded
NOTE: Running task 1988 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1989 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1990 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata unihash changed to f8500fb422e3a298dee4f6f1c4d5472a1f12834af723c71807835b4b9d4fc51b
NOTE: Running task 1991 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to d33859861b205dff1581ca30272c4215ed138c10a8a21d0e4798830d3c726a97
NOTE: Running task 1992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata unihash changed to ad7dc83a1c0e0f792e9b7554e1774a56d1e20cf2e382ec3d847188b0d4401152
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata unihash changed to 2ec0b0040434a99e763285ffbd05c58ec7527baf7eec58bd172aca2a3108b000
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata unihash changed to 414285eeebdd297b43d38b6745c2aa667dffe008a30571f350e60b956c0fd64d
NOTE: Running task 1995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: Running task 1996 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata unihash changed to 631a6f6beb2d8684561b89d361a1efbd6f87cab964a089caca009817fbf32d47
NOTE: recipe kmod-28-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1998 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2001 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata unihash changed to 819d670a7bcf2ac1672095d4d03eae4fd73462a0c65a7af94bda4a695c80b229
NOTE: Running task 2002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: Running task 2004 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install_ptest_base)
NOTE: Running task 2005 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata unihash changed to a2704d2ced67ee6a60ad1c545c8590348a24e8bd9e7033642ad54dc7f935424a
NOTE: Running task 2007 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata unihash changed to 520470652f8a21e1c44399a8569747aac37a92d74e9d36c3f57e5f9bd7df7808
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2008 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2009 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata unihash changed to 780893c5f8f5c94716033ec02471f3c10c5a2e7e23c858351cc0de813d9b836c
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata unihash changed to 64194fa67279de99c8051dac47152d18885a3302c80f58152b46f306bf88e4c6
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2010 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: Running task 2011 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: Running task 2012 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-28-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata unihash changed to bba4e17103ad3de67f0fb46ce7b3e2b638e1a194babe09a3a740f9a80a1261f8
NOTE: recipe findutils-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2015 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2016 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe kmod-28-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata unihash changed to 1f3208d6922326dc595e2b1390b387d264cd7f4ea5e9fb9ddefec6441c54bb3d
NOTE: Running task 2018 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: Running task 2019 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata unihash changed to 53b70be3b6c2d4dd99b38be79bb7cb2184e8a6612c1790c16101ea2e8fee6b2d
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: Running task 2020 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2022 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to 1cb96b498d912308a09ec1843caa8c9a71e85d7a287477b1efc6ff06da26179e
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 2024 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2025 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: Running task 2026 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2027 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata unihash changed to 7fd8fbf6db41fdc5c2cbcd7feb9f820bf6cf59517093fa9d580f5d284912ae38
NOTE: Running task 2029 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata unihash changed to 39565647741f7f823dbf35f545f88167ab487c60e997c0c2944e532d9a0173b2
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2030 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm)
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata unihash changed to 764865e72a47b6faf435383524bd5c8b40f1f1c0e1ce945b045572080abf0b9e
NOTE: Running task 2031 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: Running task 2032 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata unihash changed to 3d24148bb668ddefc7fc13080b2094d76e047176bdd633cf24dc916632d292cd
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: Running task 2034 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata unihash changed to 56497ef91ff2c7bef76b2d41c80e4193ef28c3fe23f03fe569b8841560239290
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata unihash changed to fa7bb35724c650f9694637a717b975edb2b26101949950bc0e1427f27275714f
NOTE: Running task 2035 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata unihash changed to 1018458acc645aaff4f3f854e03e96d0cd45c2e2cedcd06e7cc2b554cffd8311
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: Running task 2036 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata unihash changed to 6496d0d62584a6b6d1b789f58cb4b10a009cc9049439a4f639bb64ffc6033714
NOTE: Running task 2039 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata unihash changed to 8670470eeb36bfee2a76a8f2a08638673333dbdcd7a87e8620c005032129fd47
NOTE: Setscene tasks completed
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata unihash changed to 566ebdca13c64f2db30fcc0fabfb213f6ed674cf1db926d0f3cd2982fb7f0168
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: Running task 2042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2043 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2044 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2045 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 2046 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2047 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2048 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata unihash changed to 3c04f1fa9340fcf4243ab2870b13fca116fc0826b55b02e5c12280d27e9c67bc
NOTE: Running task 2049 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 2050 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata unihash changed to 675a3fc55e33f82b330e017a5912fa4c659ca5681edebc423f23512ba48fbe20
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata unihash changed to 6ee14f16efc10b21381c4cf5fa1d13a064ee7c746f5f3c84d503d26db388c7c0
NOTE: Setscene tasks completed
NOTE: Running task 2052 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package)
NOTE: Running task 2053 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata unihash changed to 7c5b7ed9050b385bc5562a5682fd597962cc0c9735dcf0b66dc86e683bcdebb3
NOTE: Setscene tasks completed
NOTE: Running task 2056 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package)
NOTE: Running task 2057 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package)
NOTE: Running task 2058 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Succeeded
NOTE: Running task 2059 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_install)
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_install: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2061 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata)
NOTE: recipe readline-8.1-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package)
NOTE: recipe bison-3.7.5-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata unihash changed to 469a1daf210cbc23fc9b6c1b5c731f347e0ca8ca8aad5f9f4195e67468a4810d
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: Running task 2070 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2071 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2072 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Succeeded
NOTE: Running task 2073 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Started
NOTE: Running task 2074 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2075 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata unihash changed to 0c52cd35b471542721c393f9f53d1b319350a13279f88f3a136f0dcf0d33238f
NOTE: Running task 2076 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata unihash changed to 360d73747e20269eacd66cafae30716deb78b5352522cb9f66287631015c5d50
NOTE: Running task 2077 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.5-r0: task do_package: Succeeded
NOTE: Running task 2078 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata unihash changed to ac67faf4ffbc5988bdf8189eb23fc4bafb66618f16a02879c23c45aa82f49a3a
NOTE: Setscene tasks completed
NOTE: Running task 2079 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package)
NOTE: Running task 2080 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: Running task 2081 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package)
NOTE: Running task 2082 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata unihash changed to 0b4c54ca58ae3ab2e75cb6094232b99e71548686dad3dac84e0be3f52247890e
NOTE: Setscene tasks completed
NOTE: Running task 2083 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: Running task 2084 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 2085 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe bash-5.1-r0: task do_package: Succeeded
NOTE: Running task 2086 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata unihash changed to 9fefa70e30bef4c80d709fad68ce1c1f0fca44b319f4f7bde8098a91dc4b2d2c
NOTE: Setscene tasks completed
NOTE: Running task 2088 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package)
NOTE: Running task 2089 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2090 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm)
NOTE: Running task 2091 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: Running task 2092 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata unihash changed to 40bcdbdcf07a65d8c814bbe1ea90f2fb646e01c49ed09c8ef0c81d0096e77de6
NOTE: Setscene tasks completed
NOTE: Running task 2094 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: Running task 2095 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: Running task 2096 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: Running task 2097 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata unihash changed to 347f4d50bb6a5bb69a13b363c26b355d5724585d7a7bd2b928ac419f98ab1529
NOTE: Setscene tasks completed
NOTE: Running task 2100 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2101 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe kbd-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2102 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to ecd0af29f397bb29b6c3d768c7124c37ca620c0210730a6fbd873f3dd3cc4b18
NOTE: Running task 2103 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata unihash changed to 0d683f9875ccc52c2c8afba8fffdf6258c299c187ba54933d97c1027640fc519
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata unihash changed to 97993d8fa4b1aa84e0d1cd83e4f9f27cbf6d55998ed4a466f1883e12d95d80d8
NOTE: Setscene tasks completed
NOTE: Running task 2104 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2106 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2107 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to 1223fc71efe6b4148bc406d94d609810b18d95b0860e3a5d8b698ee3044b8e7b
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package)
NOTE: recipe socat-1.7.4.1-r0: task do_package: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata unihash changed to 82701a0b6c7c8680f982b994237edeb0e195501d286f3680f197f9469bd60e2e
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package)
NOTE: Running task 2116 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package)
NOTE: Running task 2117 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2119 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 2120 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Succeeded
NOTE: Running task 2121 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2122 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata)
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Succeeded
NOTE: Running task 2124 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata)
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Succeeded
NOTE: Running task 2125 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2126 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: Running task 2127 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata unihash changed to b44f4bb769bc83d5a464f83a0bfc5d7c36bd5688dca015ab62b8944fa1d31c13
NOTE: Running task 2128 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2129 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 2130 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2131 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: Running task 2132 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2134 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 96865bf1d5d5109996ea65ee71940b04aa6329819586491fbc393d1ee7e0eb32
NOTE: Running task 2135 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata unihash changed to e28e0b8afe5c87d08b9fcd64261b0ad7292bd032749534267ba6ed8f65f7ec76
NOTE: Setscene tasks completed
NOTE: Running task 2137 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: Running task 2138 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 2139 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package_write_rpm)
NOTE: Running task 2140 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2141 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata unihash changed to 8115cffdaa5dc564c816364968c10e359f714d8c26ec9124a4d0cf4a135b05f9
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2145 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2146 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 23a997ee77e2a8648638bc0021bc2b309f4ac85f56eec9560082ee8c6c365597
NOTE: Setscene tasks completed
NOTE: Running task 2147 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2148 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to 155e5bb37a6da2bd7a331b5c30cf72caceac8b7b373743042aac2b26b6434263
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: Running task 2151 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to c6f8ba2c60841f1438bd83c5a75f7c8474680453f7fe9e82ccd38b0a8a881a70
NOTE: Setscene tasks completed
NOTE: Running task 2153 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: Running task 2154 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: Running task 2155 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2156 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to 793045f0bfbd4d5f4ca711793f524e5cf3e77573e991f8805467e77e01222c17
NOTE: Setscene tasks completed
NOTE: Running task 2159 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 10b76fa1b156941a9b9a2a099203b6c3484342435e43079c7ce8ac1290f68e73
NOTE: Running task 2161 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2162 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm)
NOTE: Running task 2163 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 931232c93f52931137292a764daeb8d169e712ad746bfaa88f27f9cbd7f199df
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: Running task 2165 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2166 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 2169 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: Running task 2172 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2173 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 9ac19411fbf35c8ff255b14d813e7e6c4953ede826da7447505e8ecc51619cd9
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 0df4b60c9950474ab5bf027fb7d2df272e1d4c3eea335a006cd457839c0481a6
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to f9e7dc5a11b6209d44bc093392e0786b2266228bc395ed42c11dbea99270c53d
NOTE: Setscene tasks completed
NOTE: Running task 2180 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2181 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2182 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2182 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4180759231048520356==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54431528748b0dbe84617a558403c4bfc52e6523"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 310 Local 5 Network 0 Missed 305 Current 378 (1% match, 55% complete)
Removing 109 stale sstate objects for arch qemuarm...done.
Removing 180 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 452 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_stash_locale_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 237 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 980 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_configure)
NOTE: Running noexec task 981 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_compile)
NOTE: Running task 982 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_install)
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.33-r0: task do_stash_locale_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 988 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_unpack)
NOTE: Running task 1001 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1021 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_fetch)
NOTE: Running task 1054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 1263 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: Running task 1265 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe bison-3.7.5-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_patch)
NOTE: recipe bison-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe bison-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: Running task 1314 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1316 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1317 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata unihash changed to d11b256074db30c6d23a6bb999f9f3de7ffa2c1d079cc9ed10da1e4a3c9169d4
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata unihash changed to 68d88590689b3e7ebba784179e62ab2a1aa2ae13e5ef3b01d7c6c145ffc2444f
NOTE: Setscene tasks completed
NOTE: Running task 1318 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1319 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1321 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_install: Succeeded
NOTE: Running task 1336 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1337 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package)
NOTE: Running task 1349 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f7fcb883545b673d77b5dad2121ae0a0ac982976b4f4e599532ff1ca1bc8f49
NOTE: Running task 1352 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_lic unihash changed to 777e4cd387d5e4bda3d55a8ce4020b5bc41fab7d890f9993bf1189d0944351f7
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_package: Started
NOTE: recipe glibc-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1353 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to bacd238c00f455b072f2c2d810631af979f120aef8239d17ac236766db318260
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package: Succeeded
NOTE: Running task 1354 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata unihash changed to 7f0ce8d311fa9069ca089dd4fb7d193e9e0444af4cacd86a6f880b8d2b641bf2
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-2.33-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_compile)
NOTE: recipe glibc-2.33-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_package: Succeeded
NOTE: Running task 1357 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata unihash changed to fc43a51651ae2af2c67ec616b15edca9693fa8c2e55ae7e5be873b853eb895aa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy became valid
NOTE: Running setscene task 980 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running task 1358 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_deploy_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_d8551cae1c-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-2.33-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_install)
NOTE: recipe glibc-2.33-r0: task do_install: Started
NOTE: recipe glibc-2.33-r0: task do_install: Succeeded
NOTE: Running task 1517 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package)
NOTE: Running task 1684 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1750 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.33-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe bison-3.7.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Started
NOTE: recipe glibc-2.33-r0: task do_package: Succeeded
NOTE: Running task 1872 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata)
NOTE: recipe glibc-2.33-r0: task do_packagedata: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata unihash changed to 3445e7346dffa58733a3dd082e0c3219910cc8c5563278b26fbbad54029c3121
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package)
NOTE: Running task 1874 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package)
NOTE: Running task 1875 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm)
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package: Started
NOTE: recipe glibc-locale-2.33-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1876 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1877 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1878 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe libgcc-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1880 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata unihash changed to a59573d155e1c0264bc956162b035678bbf2fb1062eca92930aa9053da487a9f
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1883 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package)
NOTE: Running task 1884 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1885 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata unihash changed to 5ba13dc7094ea601f5a03df3f13742fcdba8b4e5633765cb2460dde784e1df5b
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: Running task 1888 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: Running task 1889 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package)
NOTE: Running task 1890 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1891 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1892 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: Running task 1893 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 1894 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package)
NOTE: Running task 1895 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package)
NOTE: Running task 1896 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package)
NOTE: Running task 1897 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: Running task 1898 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package)
NOTE: Running task 1899 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1900 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1901 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: Running task 1902 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package)
NOTE: Running task 1903 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: Running task 1904 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package)
NOTE: Running task 1905 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: Running task 1906 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1907 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: Running task 1908 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 1909 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: Running task 1910 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: Running task 1911 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Started
NOTE: Running task 1912 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: Running task 1913 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: Running task 1914 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package)
NOTE: Running task 1915 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: Running task 1916 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package)
NOTE: Running task 1917 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1918 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1919 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Running task 1920 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_compile_ptest_base)
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata unihash changed to ab0e5c735c2177b4f427afe5e6232913e914e5f3c53391097b929d2ef46072fc
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1922 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1923 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package)
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Running task 1924 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: Running task 1925 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package: Succeeded
NOTE: Running task 1926 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm)
NOTE: Running task 1927 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1928 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata unihash changed to 6d404a5ba1697c5bd98d27fa52f12becaf68cd9294c5bd968ac62233b502b3de
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package: Succeeded
NOTE: Running task 1929 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata)
NOTE: Running task 1930 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: Running task 1931 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: Running task 1932 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: Running task 1933 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 1934 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata unihash changed to 6d57dd4f8e416de176b46fc290c2c9d45cd60f2345ff65277dd4ab45dd644089
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package: Succeeded
NOTE: Running task 1935 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata)
NOTE: Running task 1936 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata unihash changed to f053603e223fa23bcc12c04ab12d53e0323a483232e3e04eb0999a4bca4ae4c4
NOTE: Running task 1937 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata unihash changed to 866fecee9d79a0756bfd90c1ef76a3aeb1dc9f207af01c5b010ad1280e06d014
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata unihash changed to 71fa5917384d7650e34f1a51fa62645dfa61d6bc9a0914a763ca1fe55e498b42
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata unihash changed to 0b9d63fd991809222e6b9ad580e6e8089b9628b5dfc64f127c96f6a6b572b796
NOTE: Running task 1938 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: Running task 1939 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata: Succeeded
NOTE: Running task 1940 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata unihash changed to d7719c6d30a027dd86c63bbe38118720330104b95b21067f23bb8a3c2eeca320
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: Running task 1941 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: Running task 1942 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 1943 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata unihash changed to 365d3fc3a89f80491de14f5159b1e178b8ad2798458141f8b599d829e546669f
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcrypt-4.4.18-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 198bb8e770d3c604edeb88ebcb12421097e6b7697f98136de47f02d29096a5bd
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata unihash changed to 436385e20e724c697f9c739e6ec83f15b6fc44b942cb209912a71cb0108b255c
NOTE: Running task 1944 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata)
NOTE: Running task 1945 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: Running task 1946 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 1947 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1948 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1949 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata unihash changed to c68358ab504f3c014b4d54af7745d65046f00932bc35ecaecd4019d2e657e2d2
NOTE: Running task 1950 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata)
NOTE: Running task 1951 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: Running task 1952 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: Running task 1953 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Started
NOTE: Running task 1954 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: Running task 1955 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1956 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package)
NOTE: Running task 1957 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: Running task 1958 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: Running task 1959 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Started
NOTE: Running task 1960 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm)
NOTE: Running task 1961 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata unihash changed to 318531d350bcbfdc1c8c5b2715b05d7206260b9d0815c22fb314b3ebc6c90511
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Started
NOTE: recipe findutils-4.8.0-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: Running task 1962 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: Running task 1963 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata unihash changed to 56a75634cd7a9078521b732e8d05026321fdf59add6c33b860ca9bb0daeecbdb
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: Running task 1964 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package: Succeeded
NOTE: Running task 1965 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata unihash changed to e8e2fd1d940ac11669a64732c4d0a9b908cc2566515acf28a066b0c17a7723b0
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: Running task 1966 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: Running task 1967 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: Running task 1968 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: Running task 1969 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_packagedata unihash changed to 436c8c343573f5d16d8323613d925820d1896a098718aa7f43bd51ae72a8e799
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1970 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: Running task 1971 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1972 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata unihash changed to 46f548ad2105cb6804c13fdbc4536fbf3412d91ee564a41b277b06d3a73068b3
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1973 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata unihash changed to a9d0b59c44cfe164d3eaa9632ba83e17f36f11c91a0a3fb79a0f7b12a8efa43f
NOTE: Running task 1974 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to 098e1337867684a131751ce9e47348760db132b606c07bd8914f9022ccd513f1
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata unihash changed to 830b286ed1e07c5af34f4164a8b2f16d2d947f4027f484cadbf695b398c356ab
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to e7614c05cbdc1afae96ff98afdf81ac203db9d82ec12c874b62aa01599ad3030
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Running task 1976 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: Running task 1977 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: Running task 1978 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_install_ptest_base)
NOTE: Running task 1979 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: Running task 1980 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 1981 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: Running task 1982 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata unihash changed to 111b6e9d8cfdb8c1a52c1171fa2a056fa695f8f5ba90306a658a906813127131
NOTE: Running task 1983 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: Running task 1984 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1985 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata unihash changed to 50194aacb162e6e69a364af9824def6da215539efcdf7e3fdcd3aa67bd1075d2
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1986 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1987 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1988 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata unihash changed to 236f4ec2a25d05627332abfa45fdab114b879f6afd481c64dfbdf9d7d0eea55a
NOTE: Running task 1989 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1991 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1992 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to 02dec3d858e58475c3a9f1616d782123942801fc4c77a142fae1fc6c947f7d57
NOTE: Running task 1993 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata unihash changed to 37710c7dbb75947e59d97f12633c940b331424a2c0b052e024f4d433804422dc
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata unihash changed to 71848d24d4856d3bb62c0f424b92f16a031628d4b70044625c392342875bb843
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: Running task 1995 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1996 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: Running task 1997 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1998 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: Running task 1999 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe kmod-28-r0: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata unihash changed to 51653b1189c81317bc2f00feaa757581b62d2a39419142634807cab576d51fe8
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: Running task 2000 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2001 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata unihash changed to 18875e4bd1db48d036b93e814a377778e94c86bb481d38b41d9fb2b35d0184cf
NOTE: Setscene tasks completed
NOTE: Running task 2002 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: Running task 2005 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2006 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata unihash changed to bc2253a9aab5649deb0dcef1d61ad060a65e0d4c4ea1f145dbaaceb82fd45dae
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: Running task 2007 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 2008 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata unihash changed to 2f03ba47bc34ba18d578947aa8fd349312bc4bdd47cebe60bbe468038667a130
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2009 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata unihash changed to f0d425a5c6f3877978bf07b4f27c6fae0429915725db80672f4b1ad480f8b298
NOTE: Running task 2010 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: Running task 2011 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata unihash changed to ae3e7c60a12138ac7743d2d37a0c999ba62375c302e33e034e928db8b0947b3b
NOTE: Running task 2012 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: Running task 2013 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata unihash changed to 16a734676a780f9541d420b54302a62e0c908fb475cc787705c7f1640b4933fe
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: Running task 2015 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: recipe findutils-4.8.0-r0: task do_package: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2016 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package: Succeeded
NOTE: Running task 2017 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata unihash changed to cf1333bb359a24d8942d34e1d47779b967d012fe63d446ebf0936cc3bab8eb6e
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: Running task 2018 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata unihash changed to 67a2dc3201dfb9ba909a17796ae3cb8e314d9b905a9092f8a4fa7d4883d1a74a
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: Running task 2019 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2020 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata unihash changed to c1a52df8fd4cb6bfa044890265668d0ca02063a374b92886b67c52bb889ffb18
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2021 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe kmod-28-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: Running task 2023 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata unihash changed to f354208e1e37670571bcfab54122f88d82c84ce769bbd47988eb5ee155b4d9ab
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2024 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-28-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to a3251bccb3cc021676fcf8671055eb9e32677bf04ad502eb040ad441fe0a37c8
NOTE: Running task 2025 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata unihash changed to 67828b85b50e9edce4b62390cd637593342a91c9ff0324c61ef43eaf30695b52
NOTE: recipe findutils-4.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata unihash changed to 708941da6ea664c4c07f164c0c540f7255e205ece3c6d2ee1b72e1a3a514f6d5
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata unihash changed to 352cab02d7279b46dd267c6508b3a235d411c596dbb6e83158c04d3ef2d2b43d
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata unihash changed to 34ce7f2a4b1b7bcf9486eb4253e7228f9e5aa49bb918ed622c38093fdebeb7c8
NOTE: Setscene tasks completed
NOTE: Running task 2027 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm)
NOTE: Running task 2028 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: Running task 2029 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm)
NOTE: Running task 2030 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata unihash changed to 4c3355eb1dd79cc8e096c994184b5426b8905ac6d50de105bba5b1a82c983bb6
NOTE: Setscene tasks completed
NOTE: Running task 2031 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
ERROR: file-5.39-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.40-r0 to 0:5.39-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2034 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata unihash changed to 4688e09b884f4ffdbbb8dc87dd06501977592d6eb801b86f49c97a190ef4126e
NOTE: Running task 2035 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata unihash changed to 035ea4140ce25e7a0c75a47c93c8adca190aedaf17a2cd5be1e26effe797002b
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata unihash changed to fd6cc1cff61062bea8352b058799d542ee4971b0d473a24d00f7fbcd38583857
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata unihash changed to a26980153c788c24c6291b10fae01412f846a67c7e76634b6bcab5ac8b203a6f
NOTE: Running task 2039 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2041 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata unihash changed to 9ea9f1031f05666b93ec9473e2596170ad22fef01d944804707db8fe6d1fa6bb
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata unihash changed to 7b754a98248708f27236035d4c7239ac87c52d7cdf52122be4a1ffbb12ab8aa4
NOTE: Setscene tasks completed
NOTE: Running task 2042 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: Running task 2043 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package)
NOTE: recipe libpam-1.5.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2047 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_compile)
NOTE: recipe bison-3.7.5-r0: task do_compile: Started
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 2050 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata unihash changed to d5d724aca65ad4be1536186142e52191968d1674cf1f3c2cacd42e4b417b3acf
NOTE: Running task 2051 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata unihash changed to e8c2fa5888da3d8105a2265a4c5dd1b865625ce0e7aeb568b8dacb750f65ed4c
NOTE: Running task 2052 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.5-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_install)
NOTE: recipe bison-3.7.5-r0: task do_install: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata unihash changed to 2fed40ce015f12cf369f94c84bf1e701ac4288f4c07b2278018ead8aaaf8daa1
NOTE: Running task 2055 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package)
NOTE: Running task 2056 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package)
NOTE: Running task 2057 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_package: Started
NOTE: recipe bash-5.1-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata unihash changed to 5a16d9eab260162447dd1b214ce1d287ee6b1c0826ee9a4cd621edfa865d7261
NOTE: Setscene tasks completed
NOTE: Running task 2058 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package)
NOTE: Running task 2059 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_install: Succeeded
NOTE: Running task 2061 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package)
NOTE: recipe bison-3.7.5-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.1-r0: task do_package: Succeeded
NOTE: Running task 2067 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata)
NOTE: recipe readline-8.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2068 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata unihash changed to 46d419129290933f662b495512ce0c4e57c295d75c0bf361fc064517c8dbab18
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: Running task 2070 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2071 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package: Succeeded
NOTE: Running task 2072 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata)
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata unihash changed to 7f730270a971f78b53feecfb7f604dad3cf997ce84bbe94ac1776e880be4b80c
NOTE: Setscene tasks completed
NOTE: Running task 2074 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: Running task 2075 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2077 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata unihash changed to 8cd1d70d073173bbcf2336390c5d8de832bc3519e1170f784caa627da885628f
NOTE: Setscene tasks completed
NOTE: Running task 2078 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package: Succeeded
NOTE: Running task 2079 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata)
NOTE: recipe bash-5.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2080 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm)
NOTE: Running task 2081 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: Running task 2082 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: Running task 2083 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 2084 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata unihash changed to fdabbe0419e5de4c2f1cfa91e51bae725eeb6c3f49946c52dc9668dc35115f86
NOTE: Running task 2085 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package)
NOTE: Running task 2086 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata unihash changed to 3e792bc4b8a16641c257d838f451fa5d34ae7f268ea9f5205e05ea3293382719
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package)
NOTE: Running task 2088 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: Running task 2089 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package)
NOTE: Running task 2090 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package)
NOTE: recipe libcap-2.48-r0: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package: Succeeded
NOTE: Running task 2092 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata)
NOTE: recipe libcap-2.48-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata unihash changed to ded394b2c9088696479311b15a208d5e4e2cf139a87d6da80a79f52e046475c5
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata unihash changed to b8274c4ed6379a6615e3774b4ad7076a7267af968c4588fb5cb5df364104801d
NOTE: Setscene tasks completed
NOTE: Running task 2094 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: Running task 2095 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: Running task 2096 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: Running task 2097 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata unihash changed to 70cc27996a85c6e4c787e12dd6aa47c36de4c97c2c05f393796c07e547dbb241
NOTE: Setscene tasks completed
NOTE: Running task 2099 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2100 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2101 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata unihash changed to 79f1b0658b74c0c5bca73f1b2b8b2d82e0eaa48860537ec5a302836d5da40fc2
NOTE: Setscene tasks completed
NOTE: Running task 2102 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2104 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata unihash changed to 67c2d4ebb9708c5467078a1e8a4c2562d1de77c918f75e8fb16dafc7adabbd6c
NOTE: Running task 2105 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to e6ec522af1af4be47024eb48b37b680fcbff4fcfdf0d8647363aaaa8cec0624a
NOTE: Running task 2106 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to cac736988ada91a6617cb3ce152b6582dd44eb63d5d890b2669a3c4ebcbdbd0c
NOTE: Setscene tasks completed
NOTE: Running task 2107 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata unihash changed to 21da5b4f6c4c95b76b08d5b7dda6f705cd459254c506d79245cb991234b0d362
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata unihash changed to 14a21055cee8e25ada24cef13a7f9bc7677646a1a02a76bca38b7336cbf9af21
NOTE: Setscene tasks completed
NOTE: Running task 2110 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package)
NOTE: recipe socat-1.7.4.1-r0: task do_package: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata unihash changed to c4a777f9e3513a1f37fbd43188ccbc5060a244cc9dd163b81d78adf67f896994
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package)
NOTE: Running task 2116 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package)
NOTE: Running task 2117 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Started
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2119 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm)
NOTE: Running task 2120 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package: Succeeded
NOTE: Running task 2121 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2122 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata)
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.1-r0: task do_package: Succeeded
NOTE: Running task 2124 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata)
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_package: Succeeded
NOTE: Running task 2125 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata)
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2126 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: Running task 2127 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata unihash changed to 463527bb7b49847c13729b989c83dd0077a43d0e8cecdd757aefc917bf385f2d
NOTE: Running task 2128 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2129 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 2130 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: Running task 2131 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2132 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_packagedata unihash changed to cd3a95d5e81de0c267a1f88539350e9b126ba53297804681bc77ecda07020c16
NOTE: Setscene tasks completed
NOTE: Running task 2134 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2135 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2137 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.33.bb:do_package_write_rpm)
NOTE: Running task 2138 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: Running task 2139 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2140 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to b141ef6a988a3da75a4e8bbd1cc9d7792b83524339e26f221100476e48683538
NOTE: Setscene tasks completed
NOTE: Running task 2141 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata unihash changed to b079366607ee3eaefcf54803e56db04f92b8fc5c79db03b7365a16a6e21dce75
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2145 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2146 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 296766e1ea612b205a9a19da795dd1d9839887b72b74f7f5bd09cc39caee94fa
NOTE: Setscene tasks completed
NOTE: Running task 2147 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2148 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to 2bb8d95a4947f420ebbfe67674b1b9812db9526451213de0bf2d633849144511
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package)
NOTE: Running task 2151 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata unihash changed to 5ac46a9ddef7153ff61315f2620ebda420a2cf16c50b0a9f4a836e4f80cdac11
NOTE: Setscene tasks completed
NOTE: Running task 2153 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: Running task 2154 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: Running task 2155 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2156 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to 6303bebe772907c5d4f2421d2e98a489e5c46d609ce0f682e42e451c301be702
NOTE: Setscene tasks completed
NOTE: Running task 2159 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to c191110da692b19072c642dd0db4cbacbaeca99e00ece63dd95b3fda56bfdbf9
NOTE: Running task 2161 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2162 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm)
NOTE: Running task 2163 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 29675554c4fc3f03124792fb6e4cfa5a76abaf48c10b38a4dafa55bfcfad12c1
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: Running task 2165 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: Running task 2166 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 2169 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: Running task 2172 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2173 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 0e4be4b78412944e8d5eb3a51394f2949209d0d0073568607e31540b1fd38180
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 9901c4b9cb7b233245939e41124e2149a8b9e9940072794156194b9a4e4c8b1c
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to e924d939c2a6f69147b8577bbc24b5c0fa92eaa716558d0c658253ff8bead5c9
NOTE: Setscene tasks completed
NOTE: Running task 2180 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2181 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2182 of 2182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2182 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 17 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4180759231048520356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rpm: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/python3-rpm: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/python3-rpm: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-archive: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-archive: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-build: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-build: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-dbg: PKGSIZE changed from 3393228 to 3396596 (+0%)
packages/core2-32-poky-linux/rpm/rpm-dbg: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-dbg: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-dev: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-dev: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-doc: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-doc: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ar: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ar: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-br: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-br: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ca: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ca: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-cmn: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-cmn: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-cs: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-cs: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-da: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-da: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-de: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-de: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-el: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-el: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-eo: PKGSIZE changed from 64586 to 64354 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-eo: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-eo: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-es: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-es: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-fi: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-fi: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-fr: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-fr: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-id: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-id: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-is: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-is: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-it: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-it: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ja: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ja: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ko: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ko: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ms: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ms: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-nb: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-nb: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-nl: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-nl: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-pl: PKGSIZE changed from 82044 to 81798 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-pl: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-pl: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-pt-br: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-pt-br: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-pt: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-pt: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-ru: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-ru: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-sk: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-sk: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-sl: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-sl: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-sr+latin: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-sr+latin: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-sr: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-sr: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-sv: PKGSIZE changed from 71755 to 71486 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-sv: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-sv: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-te: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-te: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-tr: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-tr: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-uk: PKGSIZE changed from 87269 to 86904 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-uk: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-uk: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-vi: PKGSIZE changed from 73867 to 73621 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-vi: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-vi: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-zh-cn: PKGSIZE changed from 59174 to 58941 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-zh-cn: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-zh-cn: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-locale-zh-tw: PKGSIZE changed from 70651 to 70382 (-0%)
packages/core2-32-poky-linux/rpm/rpm-locale-zh-tw: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-locale-zh-tw: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-sign: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-sign: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-src: PKGSIZE changed from 2296859 to 2298375 (+0%)
packages/core2-32-poky-linux/rpm/rpm-src: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-src: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm-staticdev: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm-staticdev: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
packages/core2-32-poky-linux/rpm/rpm: PV changed from "4.16.1.2" to "4.16.1.3"
packages/core2-32-poky-linux/rpm/rpm: PKGV changed from 4.16.1.2 [default] to 4.16.1.3 [default]
Changes to packages/core2-32-poky-linux/rpm (sysroot):
  /usr/lib/librpmbuild.so.9 changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmbuild.so changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9 changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmio.so changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9 changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpmsign.so changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpm.so.9 changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpm.so changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpmbuild.so.9.1.2 moved to /usr/lib/librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9.1.2 moved to /usr/lib/librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9.1.2 moved to /usr/lib/librpmsign.so.9.1.3
  /usr/lib/librpm.so.9.1.2 moved to /usr/lib/librpm.so.9.1.3
  /usr/lib/rpm/rpmpopt-4.16.1.2 moved to /usr/lib/rpm/rpmpopt-4.16.1.3
Changes to packages/x86_64-linux/rpm-native (sysroot):
  /usr/lib/librpmbuild.so.9 changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmbuild.so changed symlink target from librpmbuild.so.9.1.2 to librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9 changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmio.so changed symlink target from librpmio.so.9.1.2 to librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9 changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpmsign.so changed symlink target from librpmsign.so.9.1.2 to librpmsign.so.9.1.3
  /usr/lib/librpm.so.9 changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpm.so changed symlink target from librpm.so.9.1.2 to librpm.so.9.1.3
  /usr/lib/librpmbuild.so.9.1.2 moved to /usr/lib/librpmbuild.so.9.1.3
  /usr/lib/librpmio.so.9.1.2 moved to /usr/lib/librpmio.so.9.1.3
  /usr/lib/librpmsign.so.9.1.2 moved to /usr/lib/librpmsign.so.9.1.3
  /usr/lib/librpm.so.9.1.2 moved to /usr/lib/librpm.so.9.1.3
  /usr/lib/rpm/rpmpopt-4.16.1.2 moved to /usr/lib/rpm/rpmpopt-4.16.1.3

--===============4180759231048520356==--
