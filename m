Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4571.1621074783972108535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 301BD38C1405
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 175 SUCCEEDED
Message-ID: <MADEUP.167F36EDE0AA6673.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151847
Content-Type: multipart/mixed; boundary="===============1356189936502932989=="

--===============1356189936502932989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *175* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-172-175.patch
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

--===============1356189936502932989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-172-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info

--===============1356189936502932989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1460 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-df4815ab74100a77e76536237af459a15740af1a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:df4815ab74100a77e76536237af459a15740af1a"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 82 Local 36 Network 0 Missed 46 Current 962 (43% match, 95% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 5 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 963 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 970 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 971 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 976 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 990 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1010 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1029 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1030 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1031 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1082 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 1036 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running task 2184 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2185 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2186 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2286 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_fetch)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: Running task 2352 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2353 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2354 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2355 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2356 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2397 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2405 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2406 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-175-r0: task do_fetch: Started
NOTE: recipe diffoscope-175-r0: task do_fetch: Succeeded
NOTE: Running task 2464 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: Running task 2496 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2497 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: Running task 2518 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2519 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2520 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2580 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2585 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-175-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: Running task 2672 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2673 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2674 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-175-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2711 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe diffoscope-175-r0: task do_unpack: Succeeded
NOTE: Running task 2723 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_patch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2736 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2769 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 1038 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 1039 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe diffoscope-175-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2913 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2914 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3005 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3006 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 3007 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3008 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3009 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: Running task 3010 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3011 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1041 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 3016 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-175-r0: task do_patch: Succeeded
NOTE: Running task 3017 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_deploy_source_date_epoch)
NOTE: Running task 3018 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_populate_lic)
NOTE: recipe diffoscope-175-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 3019 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-175-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-175-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3020 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3021 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: curl-7.76.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.76.1-r0 to 0:7.76.0-r0) [version-going-backwards]
NOTE: Running task 3022 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe diffoscope-175-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_populate_lic unihash changed to 7920c88cb8c465b5928fa459a870d27ba43b875a6bc57a1e0d2340d1ae801f0f
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe diffoscope-175-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 3023 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 3101 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3102 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: Running task 3103 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3113 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe diffoscope-175-r0: task do_configure: Started
NOTE: Running task 3114 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: Running task 3116 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe curl-7.76.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3161 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe diffoscope-175-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3174 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: Running task 3175 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 3176 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe diffoscope-175-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3177 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe diffoscope-175-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: Running task 3178 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3207 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: Running task 3235 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe diffoscope-175-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3240 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3241 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3242 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3243 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3244 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe diffoscope-175-r0: task do_install: Succeeded
NOTE: Running task 3245 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_package)
NOTE: Running task 3246 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_populate_sysroot)
NOTE: recipe diffoscope-175-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-175-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3247 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe diffoscope-175-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3248 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3249 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3250 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-175-r0: task do_package: Succeeded
NOTE: Running task 3251 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_packagedata)
NOTE: recipe diffoscope-175-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-175-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3253 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3254 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3255 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3256 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3257 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3258 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3259 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3260 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3261 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3262 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3263 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3264 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3265 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3266 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3267 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3268 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3269 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3270 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3271 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3272 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3273 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3274 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3275 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3276 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3277 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3278 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3279 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3280 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3281 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3282 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3283 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3284 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3285 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3286 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3287 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3288 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_package_write_rpm)
NOTE: Running task 3289 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-175-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-175-r0: task do_package_qa: Started
NOTE: recipe diffoscope-175-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-175-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3290 of 3290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_175.bb:do_build)
NOTE: Tasks Summary: Attempted 3290 tasks of which 3179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1356189936502932989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 146 recipes from the core2-32 sysroot...done.
Removing 150 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1356189936502932989==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-172-175.patch"

From 179692d256c697ab247235912096d1523314f51b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 09:58:32 +0000
Subject: [PATCH] diffoscope: upgrade 172 -> 175

---
 .../diffoscope/{diffoscope_172.bb => diffoscope_175.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_172.bb => diffoscope_175.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_172.bb b/meta/recipes-support/diffoscope/diffoscope_175.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_172.bb
rename to meta/recipes-support/diffoscope/diffoscope_175.bb
index 86dd5d8d70..853f8dd3a0 100644
--- a/meta/recipes-support/diffoscope/diffoscope_172.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_175.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5ffe7f38555c6409bc7e7edc277ed77dd78641fe1306fc38d153dbbe445ddea4"
+SRC_URI[sha256sum] = "b87481752815140e35088647ccdea13297e41a2d72772e842590360b662f7533"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============1356189936502932989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 943443 to 945787 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 172 [default] to 175 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "172" to "175"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-172.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-175.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 172 [default] to 175 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-172-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info

--===============1356189936502932989==--
