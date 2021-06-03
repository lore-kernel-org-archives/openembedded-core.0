Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2061.1622683489650427457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8A66438C08EA
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:49 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 176 SUCCEEDED
Message-ID: <MADEUP.1684EE0963C7613F.11265@lists.openembedded.org>
X-Groupsio-MsgNum: 152586
Content-Type: multipart/mixed; boundary="===============8019511225278882690=="

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *176* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-175-176.patch
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

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 149 recipes from the core2-32 sysroot...done.
Removing 153 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "175" to "176"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 175 [default] to 176 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-175.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-176.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-176-py3.9.egg-info

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c10a39de7cd74a324b130ef66176fd12258ef194"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c10a39de7cd74a324b130ef66176fd12258ef194"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 1 Network 0 Missed 41 Current 1015 (2% match, 96% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2225 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2226 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2330 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_fetch)
NOTE: Running task 2400 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2401 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2402 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2403 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2546 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2547 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2575 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe diffoscope-176-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe diffoscope-176-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2845 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2846 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2847 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2848 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2849 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2850 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2851 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2852 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2853 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2854 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe diffoscope-176-r0: task do_unpack: Started
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3054 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3055 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe diffoscope-176-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3056 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_patch)
NOTE: Running task 3057 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: Running task 3058 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3059 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3060 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3061 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3062 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3063 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3064 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7353962c5995eb43ce6b728b8435cccccd735093aa09eb01718807cb5c880526
NOTE: Running task 3159 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3173 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3186 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 3187 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3188 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3189 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-176-r0: task do_patch: Succeeded
NOTE: Running task 3190 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 3191 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3192 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3193 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3194 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic unihash changed to f9f01a653f7a12cb855ef06135e70823267ba6ca0e9f6fe44392bb8ad03bd77a
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3195 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: Running task 3196 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3197 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: Running task 3198 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-176-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3199 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3200 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to a89ab88ca1e7c5af0c37a9e8742dc12cbb16ff280c36ee341d0e4d71c92e0af4
NOTE: Setscene tasks completed
NOTE: Running task 3265 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: recipe diffoscope-176-r0: task do_configure: Succeeded
NOTE: Running task 3273 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3274 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: Running task 3275 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-176-r0: task do_compile: Succeeded
NOTE: Running task 3276 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3278 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3279 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3280 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3281 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-176-r0: task do_install: Succeeded
NOTE: Running task 3282 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package)
NOTE: Running task 3283 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_sysroot)
NOTE: recipe diffoscope-176-r0: task do_package: Started
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3284 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3285 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3286 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: Running task 3287 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Succeeded
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-176-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3221 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c10a39de7cd74a324b130ef66176fd12258ef194"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c10a39de7cd74a324b130ef66176fd12258ef194"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 1 Network 0 Missed 41 Current 1015 (2% match, 96% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2225 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2226 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2330 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_fetch)
NOTE: Running task 2400 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2401 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2402 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2403 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2493 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2494 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-176-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2535 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe diffoscope-176-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: Running task 2588 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_unpack)
NOTE: Running task 2627 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: Running task 2652 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 2670 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2683 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2719 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2720 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2721 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-176-r0: task do_unpack: Started
NOTE: Running task 2725 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2756 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2962 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2984 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: Running task 3056 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 3057 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-176-r0: task do_unpack: Succeeded
NOTE: Running task 3058 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3059 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3060 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_patch: Succeeded
NOTE: Running task 3061 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_deploy_source_date_epoch)
NOTE: Running task 3062 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic)
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3063 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3064 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: Running task 3065 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3066 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3067 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: Running task 3068 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic unihash changed to f9f01a653f7a12cb855ef06135e70823267ba6ca0e9f6fe44392bb8ad03bd77a
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3070 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3071 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3072 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: Running task 3073 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3074 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3075 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe diffoscope-176-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: Running task 3076 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: recipe diffoscope-176-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9db1ebfe9b3fd2f1fb3a0d8975c0e71132c4ac7ffd8a022230ad1822d23afd05
NOTE: Running task 3174 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3188 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-176-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3203 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3204 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3205 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ae80e3d5b4a179edfe89ddf0cfd90e569484509b91bb4d7ba20b7a9884e49191
NOTE: Setscene tasks completed
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3267 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3271 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3279 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3280 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_install: Succeeded
NOTE: Running task 3281 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package)
NOTE: Running task 3282 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3283 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3284 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3285 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Succeeded
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3286 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: Running task 3287 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-176-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Started
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3221 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============8019511225278882690==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-175-176.patch"

From f0a1e9c6cfbb9a24b7aed2e98772d2f9c41eb8c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 2 Jun 2021 23:49:44 +0000
Subject: [PATCH] diffoscope: upgrade 175 -> 176

---
 .../diffoscope/{diffoscope_175.bb => diffoscope_176.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_175.bb => diffoscope_176.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_175.bb b/meta/recipes-support/diffoscope/diffoscope_176.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_175.bb
rename to meta/recipes-support/diffoscope/diffoscope_176.bb
index 853f8dd3a0..6ca54fab73 100644
--- a/meta/recipes-support/diffoscope/diffoscope_175.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_176.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b87481752815140e35088647ccdea13297e41a2d72772e842590360b662f7533"
+SRC_URI[sha256sum] = "7d62c5837cb24bb0b7290a66d6c79ef27799cc22d2f8de4badebe77570df562e"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.17.1


--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-176-py3.9.egg-info

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c10a39de7cd74a324b130ef66176fd12258ef194"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c10a39de7cd74a324b130ef66176fd12258ef194"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 1 Network 0 Missed 41 Current 1015 (2% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2226 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2227 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2330 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_fetch)
NOTE: Running task 2400 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2401 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2402 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2403 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2559 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2578 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2579 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-176-r0: task do_fetch: Started
NOTE: recipe diffoscope-176-r0: task do_fetch: Succeeded
NOTE: Running task 2622 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_unpack)
NOTE: Running task 2627 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2657 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2666 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2696 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2719 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2720 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2721 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2722 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2723 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-176-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: Running task 2894 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-176-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: Running task 2955 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3056 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3057 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-176-r0: task do_patch: Started
NOTE: Running task 3058 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3059 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-176-r0: task do_patch: Succeeded
NOTE: Running task 3060 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_deploy_source_date_epoch)
NOTE: Running task 3061 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic)
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic unihash changed to f9f01a653f7a12cb855ef06135e70823267ba6ca0e9f6fe44392bb8ad03bd77a
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3062 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3063 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3064 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3065 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-176-r0: task do_configure: Started
NOTE: Running task 3066 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3068 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3069 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-176-r0: task do_configure: Succeeded
NOTE: Running task 3070 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3071 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3072 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3073 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-176-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3074 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3075 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3076 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3077 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_compile: Succeeded
NOTE: Running task 3078 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: Running task 3079 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b0bd4b956355d1351e65f6f6b22dd85a86503a98cfac2900754f37891017fa9c
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: Running task 3174 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_install: Started
NOTE: Running task 3188 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3203 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3204 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3205 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3206 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3207 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe diffoscope-176-r0: task do_install: Succeeded
NOTE: Running task 3209 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package)
NOTE: Running task 3210 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_sysroot)
NOTE: recipe diffoscope-176-r0: task do_package: Started
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 282c3d6360e5bd55524ab52880de1765c1e1d43af1f8d999f066debeaae29e00
NOTE: Setscene tasks completed
NOTE: Running task 3275 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3283 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: Running task 3284 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-176-r0: task do_package: Succeeded
NOTE: Running task 3285 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3286 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe diffoscope-176-r0: task do_packagedata: Succeeded
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3221 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============8019511225278882690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1460 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (822 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c10a39de7cd74a324b130ef66176fd12258ef194"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c10a39de7cd74a324b130ef66176fd12258ef194"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 1 Network 0 Missed 41 Current 1019 (2% match, 96% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1110 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2244 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2245 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2348 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_fetch)
NOTE: Running task 2418 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2419 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2420 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2421 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2422 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2602 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2603 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2604 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-176-r0: task do_fetch: Started
NOTE: recipe diffoscope-176-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: Running task 2639 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_unpack)
NOTE: Running task 2645 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2704 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: Running task 2735 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2820 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2837 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe diffoscope-176-r0: task do_unpack: Started
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 3068 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 3069 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3070 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe diffoscope-176-r0: task do_unpack: Succeeded
NOTE: Running task 3071 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 3072 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe diffoscope-176-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3073 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: Running task 3074 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: Running task 3075 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 3076 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3077 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3078 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-176-r0: task do_patch: Succeeded
NOTE: Running task 3079 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_deploy_source_date_epoch)
NOTE: Running task 3080 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic)
NOTE: recipe diffoscope-176-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3081 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3082 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-176-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3083 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: Running task 3084 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_configure)
NOTE: recipe diffoscope-176-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_lic unihash changed to f9f01a653f7a12cb855ef06135e70823267ba6ca0e9f6fe44392bb8ad03bd77a
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe diffoscope-176-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe diffoscope-176-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3086 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_compile)
NOTE: Running task 3087 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: Running task 3088 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe diffoscope-176-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3090 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3091 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3092 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-176-r0: task do_compile: Succeeded
NOTE: Running task 3094 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3095 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 3097 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-176-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3098 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b058d65b7ecf2e582e8b45e3e61cdad604192782062fe750397f705e0d9d20d0
NOTE: Running task 3193 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3207 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3221 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3222 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3223 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef81a923a976d58e96871431d8f8527287c0885c2f08bd02a58f765c3bab4c60
NOTE: Setscene tasks completed
NOTE: Running task 3288 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3296 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-176-r0: task do_install: Succeeded
NOTE: Running task 3297 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package)
NOTE: Running task 3298 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3301 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe diffoscope-176-r0: task do_populate_sysroot: Succeeded
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3302 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.23-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3303 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package: Succeeded
NOTE: Running task 3304 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_packagedata)
NOTE: recipe diffoscope-176-r0: task do_packagedata: Started
NOTE: recipe diffoscope-176-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3305 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3307 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3308 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3309 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3311 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3312 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3313 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3314 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3315 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3318 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3319 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3320 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3321 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3322 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3323 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3324 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3325 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3326 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3327 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3328 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3329 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3330 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3331 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3332 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3333 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3335 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3336 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_write_rpm)
NOTE: Running task 3337 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Started
NOTE: recipe diffoscope-176-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-176-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3338 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_176.bb:do_build)
NOTE: Tasks Summary: Attempted 3338 tasks of which 3239 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============8019511225278882690==--
