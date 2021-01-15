Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.723.1610713823240905993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F1D1338C140E
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 164 SUCCEEDED
Message-ID: <MADEUP.165A67B0C3AF323C.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146811
Content-Type: multipart/mixed; boundary="===============2342244398465589501=="

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *164* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-163-164.patch
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

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info
  /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py was added
  /usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc was added

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1421 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 20 Missed 36 Current 921 (35% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1079 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2151 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_fetch)
NOTE: Running task 2220 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2221 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2222 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2223 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2319 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 2320 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_fetch)
NOTE: recipe diffoscope-164-r0: task do_fetch: Started
NOTE: recipe diffoscope-164-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: Running task 2406 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_unpack)
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2455 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2461 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2462 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2463 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 2517 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Started
NOTE: Running task 2553 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-164-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 2554 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2555 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 2556 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: Running task 2557 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: Running task 2634 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2635 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: Running task 2636 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-164-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: Running task 2654 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_patch)
NOTE: Running task 2655 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe diffoscope-164-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2892 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2893 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2894 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2895 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2896 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2897 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2898 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-164-r0: task do_patch: Succeeded
NOTE: Running task 2901 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_deploy_source_date_epoch)
NOTE: Running task 2902 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic)
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2903 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2905 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2906 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic unihash changed to 47d9fdfe5664add9f1309e64a9e0d800e918d80eb62a5cca91d0b7b7919541b9
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2907 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2998 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-164-r0: task do_configure: Started
NOTE: Running task 3000 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: Running task 3005 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-164-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3014 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3015 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3016 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3018 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: Running task 3019 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-164-r0: task do_compile: Succeeded
NOTE: Running task 3020 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3021 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe diffoscope-164-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3051 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: Running task 3080 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3085 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3086 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3088 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe diffoscope-164-r0: task do_install: Succeeded
NOTE: Running task 3089 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package)
NOTE: Running task 3090 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-164-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3091 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package: Succeeded
NOTE: Running task 3094 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_packagedata: Started
NOTE: recipe diffoscope-164-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3095 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 3100 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 3101 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: Running task 3103 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Started
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_install)
NOTE: recipe libarchive-3.4.3-r0: task do_install: Started
NOTE: recipe libarchive-3.4.3-r0: task do_install: Succeeded
NOTE: Running task 3108 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package)
NOTE: recipe libarchive-3.4.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3109 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3110 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3111 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_write_rpm)
NOTE: Running task 3112 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Started
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package_write_rpm)
NOTE: Running task 3115 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3116 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_build)
NOTE: Tasks Summary: Attempted 3116 tasks of which 3030 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 20 Missed 36 Current 917 (35% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2133 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_fetch)
NOTE: Running task 2202 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2203 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2204 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2205 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2301 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 2302 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_fetch)
NOTE: recipe diffoscope-164-r0: task do_fetch: Started
NOTE: recipe diffoscope-164-r0: task do_fetch: Succeeded
NOTE: Running task 2379 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_unpack)
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2438 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2443 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2444 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2457 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2505 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-164-r0: task do_unpack: Started
NOTE: Running task 2535 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 2536 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 2537 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_unpack)
NOTE: Running task 2538 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: Running task 2539 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: Running task 2596 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: recipe diffoscope-164-r0: task do_unpack: Succeeded
NOTE: Running task 2617 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_patch)
NOTE: Running task 2619 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2620 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe diffoscope-164-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: Running task 2876 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2878 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2879 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2880 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2881 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2882 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe diffoscope-164-r0: task do_patch: Succeeded
NOTE: Running task 2883 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_deploy_source_date_epoch)
NOTE: Running task 2884 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic)
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 2885 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: Running task 2886 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2887 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2889 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic unihash changed to 47d9fdfe5664add9f1309e64a9e0d800e918d80eb62a5cca91d0b7b7919541b9
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2891 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2892 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2893 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe diffoscope-164-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: Running task 2984 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-164-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Started
NOTE: Running task 2985 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-164-r0: task do_compile: Started
NOTE: Running task 2999 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: Running task 3000 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3001 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe diffoscope-164-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_install)
NOTE: Running task 3003 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3004 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe diffoscope-164-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: Setscene tasks completed
NOTE: Running task 3062 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_install: Succeeded
NOTE: Running task 3070 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package)
NOTE: Running task 3071 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_sysroot)
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-164-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package: Succeeded
NOTE: Running task 3076 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_packagedata: Started
NOTE: recipe diffoscope-164-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3081 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: Running task 3085 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Started
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_install)
NOTE: recipe libarchive-3.4.3-r0: task do_install: Started
NOTE: recipe libarchive-3.4.3-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package)
NOTE: recipe libarchive-3.4.3-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_packagedata)
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Started
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package_write_rpm)
NOTE: Running task 3093 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3094 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3095 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3096 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_write_rpm)
NOTE: Running task 3097 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3098 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_build)
NOTE: Tasks Summary: Attempted 3098 tasks of which 3012 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 136 recipes from the core2-32 sysroot...done.
Removing 140 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 20 Missed 36 Current 917 (35% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2133 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_fetch)
NOTE: Running task 2202 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2203 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2204 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2205 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2301 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_fetch)
NOTE: Running task 2302 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe diffoscope-164-r0: task do_fetch: Started
NOTE: recipe diffoscope-164-r0: task do_fetch: Succeeded
NOTE: Running task 2409 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_unpack)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: Running task 2442 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: Running task 2443 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2455 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2470 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 2511 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2535 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2536 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-164-r0: task do_unpack: Started
NOTE: Running task 2537 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 2538 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: Running task 2604 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_unpack)
NOTE: Running task 2616 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2617 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: Running task 2635 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe diffoscope-164-r0: task do_unpack: Succeeded
NOTE: Running task 2645 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2659 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Started
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe diffoscope-164-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 2876 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2878 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2879 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2880 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2881 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe diffoscope-164-r0: task do_patch: Succeeded
NOTE: Running task 2882 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_deploy_source_date_epoch)
NOTE: Running task 2883 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic)
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2884 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2885 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2886 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2887 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 2889 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic unihash changed to 47d9fdfe5664add9f1309e64a9e0d800e918d80eb62a5cca91d0b7b7919541b9
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2891 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: Running task 2892 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: recipe diffoscope-164-r0: task do_configure: Started
NOTE: Running task 2983 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2997 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2998 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 2999 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3000 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3001 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-164-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe diffoscope-164-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_install)
NOTE: Running task 3004 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe diffoscope-164-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3062 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: Running task 3068 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_install: Succeeded
NOTE: Running task 3070 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package)
NOTE: Running task 3071 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_sysroot)
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-164-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3073 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: Running task 3074 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3075 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package: Succeeded
NOTE: Running task 3076 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_packagedata: Started
NOTE: recipe diffoscope-164-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 3081 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: Running task 3085 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Started
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_install)
NOTE: recipe libarchive-3.4.3-r0: task do_install: Started
NOTE: recipe libarchive-3.4.3-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package)
NOTE: recipe libarchive-3.4.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.4.3-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_packagedata)
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3094 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_write_rpm)
NOTE: Running task 3095 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_qa)
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Started
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package_write_rpm)
NOTE: Running task 3097 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3098 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_build)
NOTE: Tasks Summary: Attempted 3098 tasks of which 3012 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============2342244398465589501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-163-164.patch"

From e8c20919a4fb174076c935d6c592f280845ec19e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:45:43 +0000
Subject: [PATCH] diffoscope: upgrade 163 -> 164

---
 .../diffoscope/{diffoscope_163.bb => diffoscope_164.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_163.bb => diffoscope_164.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_163.bb b/meta/recipes-support/diffoscope/diffoscope_164.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_163.bb
rename to meta/recipes-support/diffoscope/diffoscope_164.bb
index 2b66d628fd..7707c441ca 100644
--- a/meta/recipes-support/diffoscope/diffoscope_163.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_164.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1afeea6e383bdd2626a9e9b827ff487723c0de581d9f9f4d4f5fc9b65728662a"
+SRC_URI[sha256sum] = "bc269a39ec72261d9fead55bd951f6cbbe3d2ccce1481f974665999a5b141fff"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.27.0


--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8ff1eb59fe7498e55fb1b84f13f282eb05dc087"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 20 Missed 36 Current 917 (35% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2133 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_fetch)
NOTE: Running task 2202 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2203 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2204 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2205 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2301 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 2302 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_fetch)
NOTE: recipe diffoscope-164-r0: task do_fetch: Started
NOTE: recipe diffoscope-164-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: Running task 2439 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_unpack)
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: Running task 2442 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2475 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2476 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2491 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2534 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Started
NOTE: Running task 2535 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2536 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2537 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2538 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 2572 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe diffoscope-164-r0: task do_unpack: Started
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2616 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2617 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2693 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: Running task 2694 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe diffoscope-164-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2718 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_patch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe diffoscope-164-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libarchive-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2876 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2877 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2878 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2879 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2880 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2881 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2882 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe diffoscope-164-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-164-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2883 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_deploy_source_date_epoch)
NOTE: Running task 2884 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe libarchive-3.4.3-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2885 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2886 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2888 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2889 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-164-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_lic unihash changed to 47d9fdfe5664add9f1309e64a9e0d800e918d80eb62a5cca91d0b7b7919541b9
NOTE: recipe diffoscope-164-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2891 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: Running task 2892 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: Running task 2893 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_configure)
NOTE: recipe diffoscope-164-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: Running task 2984 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Started
NOTE: Running task 2985 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 2998 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: Running task 2999 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3001 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-164-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3004 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe diffoscope-164-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3062 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-164-r0: task do_install: Succeeded
NOTE: Running task 3070 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package)
NOTE: Running task 3071 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_populate_sysroot)
NOTE: recipe diffoscope-164-r0: task do_package: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe diffoscope-164-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package: Succeeded
NOTE: Running task 3076 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_packagedata)
NOTE: recipe diffoscope-164-r0: task do_packagedata: Started
NOTE: recipe diffoscope-164-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 3081 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: Running task 3085 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_compile)
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Started
NOTE: recipe libarchive-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_install)
NOTE: recipe libarchive-3.4.3-r0: task do_install: Started
NOTE: recipe libarchive-3.4.3-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package)
NOTE: recipe libarchive-3.4.3-r0: task do_package: Started
NOTE: recipe libarchive-3.4.3-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_packagedata)
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Started
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
ERROR: libarchive-3.4.3-r0 do_packagedata: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.5.1-r0 to 0:3.4.3-r0) [version-going-backwards]
NOTE: recipe libarchive-3.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_package_write_rpm)
NOTE: Running task 3093 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3094 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3095 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3096 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_write_rpm)
NOTE: Running task 3097 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_package_qa)
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-164-r0: task do_package_qa: Started
NOTE: recipe libarchive-3.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-164-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3098 of 3098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_164.bb:do_build)
NOTE: Tasks Summary: Attempted 3098 tasks of which 3012 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============2342244398465589501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 923908 to 935074 (+1%)
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py"
packages/core2-32-poky-linux/diffoscope: PV changed from "163" to "164"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 163 [default] to 164 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-163.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-164.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info
  /usr/lib/python3.9/site-packages/diffoscope/comparators/fit.py was added
  /usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/fit.cpython-39.pyc was added

--===============2342244398465589501==--
