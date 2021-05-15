Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4465.1621074783516824425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8600038C130C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.12.1 SUCCEEDED
Message-ID: <MADEUP.167F36ED49E89E93.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151785
Content-Type: multipart/mixed; boundary="===============3944699887059113918=="

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.12-5.12.1.patch
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

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/top_level.txt was removed

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1461 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-a7b597400a6266620bb0f65bc2d24bc1fef66689"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a7b597400a6266620bb0f65bc2d24bc1fef66689"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Network 0 Missed 12 Current 702 (36% match, 98% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 709 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 710 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 719 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
NOTE: Running task 1086 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1641 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2033 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2194 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic unihash changed to a63e746cf051f07825410284a0afcd642b7aae142f6a9ae956275b4101b17429
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2195 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2196 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: Running task 2219 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2235 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: Running task 2265 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2267 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2268 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2269 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to f88a3ffb92e9e033c57a5b3465c8574ee2c7563c6b8092a64d9647749eb3edfa
NOTE: Running noexec task 2270 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2270 tasks of which 2249 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a7b597400a6266620bb0f65bc2d24bc1fef66689"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a7b597400a6266620bb0f65bc2d24bc1fef66689"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Network 0 Missed 12 Current 702 (36% match, 98% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 709 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 710 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 719 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1086 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1641 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2138 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2193 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2195 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2196 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic unihash changed to a63e746cf051f07825410284a0afcd642b7aae142f6a9ae956275b4101b17429
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: Running task 2219 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2235 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: Running task 2265 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2267 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2268 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2269 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to a48bf8a5716e94fbc7c9ce909a50230f3543741e29bab78e255a7dd2e8ee0753
NOTE: Running noexec task 2270 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2270 tasks of which 2249 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3944699887059113918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.12-5.12.1.patch"

From 3f1ea159b2926c81bbd90a6cee91d6e9cb37454f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 04:03:44 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.12 -> 5.12.1

---
 .../btrfs-tools/{btrfs-tools_5.12.bb => btrfs-tools_5.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.12.bb => btrfs-tools_5.12.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
index 8a809427f5..3fc959bf8e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
@@ -19,7 +19,7 @@ DEPENDS_append_class-target = " udev"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "b16b0a766f06138de2ee32d4d84b7110e469ff49"
+SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.27.0


--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a7b597400a6266620bb0f65bc2d24bc1fef66689"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a7b597400a6266620bb0f65bc2d24bc1fef66689"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Network 0 Missed 12 Current 702 (36% match, 98% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 709 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 710 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 719 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
NOTE: Running task 1086 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1521 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1937 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2194 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic unihash changed to a63e746cf051f07825410284a0afcd642b7aae142f6a9ae956275b4101b17429
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2195 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2196 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: Running task 2219 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2235 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: Running task 2265 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2267 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2268 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2269 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 4a1e9098f45b3d0b6efea5bb463afeacd3d0927357d5ea45e690239071a9d341
NOTE: Running noexec task 2270 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2270 tasks of which 2249 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-a7b597400a6266620bb0f65bc2d24bc1fef66689"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a7b597400a6266620bb0f65bc2d24bc1fef66689"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Network 0 Missed 12 Current 702 (36% match, 98% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 709 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 710 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 719 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
NOTE: Running task 1086 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.19-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.20-r0 to 0:4.4.19-r0) [version-going-backwards]
NOTE: recipe libxcrypt-4.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1521 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1954 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2194 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_lic unihash changed to a63e746cf051f07825410284a0afcd642b7aae142f6a9ae956275b4101b17429
NOTE: recipe btrfs-tools-5.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2195 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2196 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: Running task 2219 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2235 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: Running task 2265 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2267 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2268 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2269 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 46fdf5f7cf5bfb9570922edaa4120d1622c2b638437daa7d53ee88e6c0082166
NOTE: Running noexec task 2270 of 2270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2270 tasks of which 2249 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3944699887059113918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17842404 to 17856032 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 218073 to 218077 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3354822 to 3355952 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.12" to "5.12.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6359417 to 6363515 (+0%)
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.12 [default] to 5.12.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.12" to "5.12.1"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.12-py3.9.egg-info/top_level.txt was removed

--===============3944699887059113918==--
