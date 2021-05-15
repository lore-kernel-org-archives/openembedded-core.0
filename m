Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4692.1621074784024300314
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5916838C124A
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at: upgrading to 3.2.2 FAILED
Message-ID: <MADEUP.167F36ED683D622A.8202@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0471390207246281750=="

--===============0471390207246281750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at* to *3.2.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade at -V 3.2.2
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-e14563eab859249c881ec2661d7db44065a1f359"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e14563eab859249c881ec2661d7db44065a1f359"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857' failed with exit code 1:
cp: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch]': No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857:154 exit 1 from 'cp -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/at-3.2.1'
WARNING: Backtrace (BB generated script): 
	#1: copy_sources, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 154
	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 157

Backtrace (metadata-relative locations):
	#1: copy_sources, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at_3.2.1.bb, line 57
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/log.do_patch.3735857
Log data follows:
| DEBUG: Executing python function devtool_pre_patch
| DEBUG: Python function devtool_pre_patch finished
| DEBUG: Executing python function patch_task_patch_prefunc
| DEBUG: Python function patch_task_patch_prefunc finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['patch-native', 'autoconf-native', 'libtool-native', 'automake-native', 'attr-native', 'quilt-native', 'm4-native', 'gnu-config-native', 'texinfo-dummy-native', 'gettext-minimal-native']
| NOTE: Skipping as already exists in sysroot: []
| DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/recipe-sysroot-native/:g' /home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/autoconf-native/fixmepath /home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/libtool-native/fixmepath /home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/automake-native/fixmepath /home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/quilt-native/fixmepath /home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/gnu-config-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/recipe-sysroot:g; s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3
 .2.1-r0/devtooltmp-5ydj8moc/workdir/recipe-sysroot-native:g' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/pkgdata/qemux86-64:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/fifo.3735857:g'
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function do_patch
| DEBUG: Executing python function patch_do_patch
| DEBUG: Searching for fix_parallel_build_error.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for posixtm.c in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for posixtm.h in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for file_replacement_with_gplv2.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for atd.init in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for atd.service in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for pam.conf.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for configure-add-enable-pam.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for makefile-fix-parallel.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| DEBUG: Searching for 0001-remove-glibc-assumption.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/poky
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at-3.2.1/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/
|     /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/files/
| NOTE: Applying patch 'fix_parallel_build_error.patch' (../poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch)
| NOTE: self._current is None
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}
| NOTE: Applying patch 'file_replacement_with_gplv2.patch' (../poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch)
| NOTE: self._current is 0
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}
| NOTE: Applying patch 'pam.conf.patch' (../poky/meta/recipes-extended/at/at/pam.conf.patch)
| NOTE: self._current is 1
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/pam.conf.patch', 'strippath': '1', 'filemd5': '1fcaae6eeb22634bc8f2b92432addfc9'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/pam.conf.patch', 'strippath': '1', 'filemd5': '1fcaae6eeb22634bc8f2b92432addfc9'}
| NOTE: Applying patch 'configure-add-enable-pam.patch' (../poky/meta/recipes-extended/at/at/configure-add-enable-pam.patch)
| NOTE: self._current is 2
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/pam.conf.patch', 'strippath': '1', 'filemd5': '1fcaae6eeb22634bc8f2b92432addfc9'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/configure-add-enable-pam.patch', 'strippath': '1', 'filemd5': '40e9dc5e6e705b5575552a04b062f0ec'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/configure-add-enable-pam.patch', 'strippath': '1', 'filemd5': '40e9dc5e6e705b5575552a04b062f0ec'}
| NOTE: Applying patch 'makefile-fix-parallel.patch' (../poky/meta/recipes-extended/at/at/makefile-fix-parallel.patch)
| NOTE: self._current is 3
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/pam.conf.patch', 'strippath': '1', 'filemd5': '1fcaae6eeb22634bc8f2b92432addfc9'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/configure-add-enable-pam.patch', 'strippath': '1', 'filemd5': '40e9dc5e6e705b5575552a04b062f0ec'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/makefile-fix-parallel.patch', 'strippath': '1', 'filemd5': '978ca56abcda8c7f91b1857a17bd75ce'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/makefile-fix-parallel.patch', 'strippath': '1', 'filemd5': '978ca56abcda8c7f91b1857a17bd75ce'}
| NOTE: Applying patch '0001-remove-glibc-assumption.patch' (../poky/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch)
| NOTE: self._current is 4
| NOTE: patches is [{'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/fix_parallel_build_error.patch', 'strippath': '1', 'filemd5': 'ac71f9844848d8706e21af98410c5b7a'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch', 'strippath': '1', 'filemd5': 'fa89dede93bef807c541a60b0c02ab44'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/pam.conf.patch', 'strippath': '1', 'filemd5': '1fcaae6eeb22634bc8f2b92432addfc9'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/configure-add-enable-pam.patch', 'strippath': '1', 'filemd5': '40e9dc5e6e705b5575552a04b062f0ec'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/makefile-fix-parallel.patch', 'strippath': '1', 'filemd5': '978ca56abcda8c7f91b1857a17bd75ce'}, {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky
 /meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch', 'strippath': '1', 'filemd5': 'fd1bd7c4ec268b37d57ead94376960f4'}]
| NOTE: applying patch {'file': '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch', 'strippath': '1', 'filemd5': 'fd1bd7c4ec268b37d57ead94376960f4'}
| DEBUG: Python function patch_do_patch finished
| DEBUG: Python function do_patch finished
| DEBUG: Executing python function do_qa_patch
| DEBUG: Python function do_qa_patch finished
| DEBUG: Executing shell function copy_sources
| cp: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch]': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857:154 exit 1 from 'cp -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/at-3.2.1'
| WARNING: Backtrace (BB generated script):
| 	#1: copy_sources, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 154
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 157
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857' failed with exit code 1:
| cp: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch]': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857:154 exit 1 from 'cp -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/posixtm.[ch] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/workdir/at-3.2.1'
| WARNING: Backtrace (BB generated script):
| 	#1: copy_sources, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 154
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at/3.2.1-r0/devtooltmp-5ydj8moc/temp/run.copy_sources.3735857, line 157
| 
| Backtrace (metadata-relative locations):
| 	#1: copy_sources, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/at/at_3.2.1.bb, line 57
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for at failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0471390207246281750==--
