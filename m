Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7FBC87FDE
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13524.1681581685364410977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UmB0L0+p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018786143d72-eaf474a7-ac61-4a9a-b1f5-15ea30921e56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kE76V9u87oFec1BpSeWLfNe5hIbGylLF8su8Y9W41bg=;
	b=UmB0L0+pzHUT4EUt1Y2hTR6L7qoxQY2ju/oYUl+Fp4GopVydxJ0BuoaVAMjIeb3N
	8vqzdFklZf4M7SbCubcYH5DXlbHwruUpDJX+TBNm1/GS20fhhJkYzzfRVo4syHjv+ao
	zfGx7obkaDVXo4bisHMmGOpmgV3MBC/dFlOjEnJ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kE76V9u87oFec1BpSeWLfNe5hIbGylLF8su8Y9W41bg=;
	b=mcHWOKgaIipwPjtlC1p4FPC2DKAD7Gb2acNQ1VVROm1+y6ITU+QL6eMXVmIB1Min
	dUpda1CwXpV/K+FxuytB9KYFFTH4ighpLSNKoxiF+5oGpDosCTTinJ8TWgyMS1QRqLz
	DKk3O1s3sqf8TGl68fUPjyw3JFtx5yrcW5NZ6bfo=
Content-Type: multipart/mixed; boundary="===============5782899776027651897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.7.2 FAILED
Message-ID: <0101018786143d72-eaf474a7-ac61-4a9a-b1f5-15ea30921e56-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180075

--===============5782899776027651897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *waffle* to *1.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-waffle-upgrade-1.7.0-1.7.2.patch
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
--===============5782899776027651897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6aad975a6283ef7c08ed9c1850f5e879a34f9bfb"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 148 Local 141 Mirrors 0 Missed 7 Current 324 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1440 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1651 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1682 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 1683 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1684 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1685 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_lic)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_lic: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_lic: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1687 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuil
 d/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:na
 tive:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'python3', 'qemu-native', 'quilt-native', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxcb', 'bash-completion', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'wayland-native', 'zlib-native', 'xz-native', 'glib-2.0-native', 'libffi', 'expat', 'libxml2', 'libtool-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-build-native', 'python3-installer-native', 'libxml2-native', 'expat-native', 'libffi-native', 'util-macros', 'autoconf-archive', 'xtrans', 'xorgproto', 'openssl-native', 'bzip2-native', 'ncurses-native', 'zstd-native', 'attr-native', 're2c-native', 'util-linux-libuuid', 'xz', 'libnsl2', 'readline', 'openssl', 'opkg-utils', 'libxcrypt', 'libtirpc', 'ncurses', 'sqlite3', 'bzip2', 'gdbm', 'zlib', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'libxau', 'util-linux-libuuid-native', '
 libtirpc-native', 'libnsl2-native', 'sqlite3-native', 'gdbm-native', 'readline-native', 'libseccomp', 'update-rc.d', 'libcap', 'shadow-native', 'initscripts', 'shadow', 'shadow-sysroot', 'libxkbcommon', 'base-passwd', 'libpam', 'zstd', 'kmod', 'base-files', 'util-linux', 'acl', 'xrandr', 'vulkan-loader', 'libxxf86vm', 'libdrm', 'libxdamage', 'vulkan-headers', 'libxfixes', 'libxshmfence', 'libxext', 'linux-libc-headers', 'libgcc', 'binutils-cross-i686', 'gnu-config-native', 'libmpc-native', 'flex-native', 'texinfo-dummy-native', 'mpfr-native', 'gmp-native', 'gettext-minimal-native', 'libpcre2-native', 'gettext-native', 'util-linux-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'perl-native', 'attr', 'xkeyboard-config', 'cracklib', 'libcap-ng', 'libxrandr', 'libxrender', 'libpciaccess', 'm4-native', 'libcap-ng-native', 'unzip-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing subdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.4.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.3.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.3.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing subdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.4.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.3.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.3.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing src/waffle/libwaffle-1.so.0.7.2 to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/lib
| Installing src/utils/wflinfo to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/bin
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/include/waffle-1/waffle.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/include/waffle-1/waffle_gbm.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/include/waffle-1/waffle_glx.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/include/waffle-1/waffle_wayland.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/include/waffle-1/waffle_x11_egl.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/build/include/waffle_version.h to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/include/waffle-1/
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/shell-completion/bash/wflinfo to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/bash-completion/completions
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/shell-completion/zsh/_wflinfo to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/zsh/site-functions
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/README.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/LICENSE.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/HACKING.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/third_party/threads/LICENSE to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/build/meson-private/waffle-1.pc to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/lib/pkgconfig
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/examples/Makefile.example to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/examples
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/examples/gl_basic.c to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/examples
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/examples/simple-x11-egl.c to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/examples
| Installing symlink pointing to libwaffle-1.so.0.7.2 to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/lib/libwaffle-1.so.0
| Installing symlink pointing to libwaffle-1.so.0 to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/lib/libwaffle-1.so
| sed: can't read /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image//usr/lib/cmake/Waffle/WaffleConfig.cmake: No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.818809:153 exit 2 from 'sed -i -e "s,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0,,g" /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image//usr/lib/cmake/Waffle/WaffleConfig.cmake'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.818809, line 153
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.818809, line 162
NOTE: recipe waffle-1.7.2-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1689 tasks of which 1679 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: waffle-1.7.2-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.818809', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/log.do_install.818809
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install) failed with exit code '1'

--===============5782899776027651897==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-waffle-upgrade-1.7.0-1.7.2.patch"

RnJvbSBhYjE1OWZhY2M5MDU4ZWUxN2Q2OGUzMGI1ZWNlNWYyMzM1NTlmODgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6MTA6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YWZmbGU6IHVwZ3JhZGUgMS43LjAgLT4gMS43LjIKCi0tLQogLi4uYnVpbGQtcmVxdWVzdC1uYXRp
dmUtd2F5bGFuZC1zY2FubmVyLnBhdGNoIHwgIDkgKysrKy0tLS0KIC4uLi1tYWtlLWNvcmUtcHJv
dG9jb2wtaW50by10aGUtbGlicmFyeS5wYXRjaCB8IDIzICsrKystLS0tLS0tLS0tLS0tLS0KIC4u
Li97d2FmZmxlXzEuNy4wLmJiID0+IHdhZmZsZV8xLjcuMi5iYn0gICAgICB8ICA0ICsrLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS97d2FmZmxlXzEuNy4wLmJiID0+IHdhZmZsZV8x
LjcuMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxl
L3dhZmZsZS8wMDAxLW1lc29uLmJ1aWxkLXJlcXVlc3QtbmF0aXZlLXdheWxhbmQtc2Nhbm5lci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlLzAwMDEtbWVzb24uYnVp
bGQtcmVxdWVzdC1uYXRpdmUtd2F5bGFuZC1zY2FubmVyLnBhdGNoCmluZGV4IDFiNjJkYjkyZTku
LjIwOGM1YzUzNDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2Fm
ZmxlLzAwMDEtbWVzb24uYnVpbGQtcmVxdWVzdC1uYXRpdmUtd2F5bGFuZC1zY2FubmVyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlLzAwMDEtbWVzb24uYnVp
bGQtcmVxdWVzdC1uYXRpdmUtd2F5bGFuZC1zY2FubmVyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyMTk1Y2VjMWU1YmM2NjEyOGQ3MjA0OWMxMWZmMzgxY2E0NTE2YTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBhZDA3YTBiYmY3OWJkYjM1NzAxYzhhYzRhNzQ3OGFmNjg4YjE2
YmY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KIERhdGU6IFR1ZSwgNSBKdWwgMjAyMiAxMTo1MTozOSArMDIwMAog
U3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogcmVxdWVzdCBuYXRpdmUgd2F5bGFuZC1zY2Fu
bmVyCkBAIC04LDE1ICs4LDE2IEBAIHRyeSB0byB1c2UgYSBjcm9zcy1iaW5hcnksIGFuZCBmYWls
LgogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL21lc2Evd2FmZmxlLy0vbWVyZ2VfcmVxdWVzdHMvMTEwXQogU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KKwogLS0tCiAgbWVzb24uYnVp
bGQgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwYmI2MTI4
Li4wYjZkYTFmIDEwMDY0NAoraW5kZXggY2E2YTIxMi4uMzE3N2JkZSAxMDA2NDQKIC0tLSBhL21l
c29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTEwOCw3ICsxMDgsNyBAQCBlbHNlCitA
QCAtMTEwLDcgKzExMCw3IEBAIGVsc2UKICAgICAgJ3dheWxhbmQtZWdsJywgdmVyc2lvbiA6ICc+
PSA5LjEnLCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3dheWxhbmQnKSwKICAgICkKICAgIGRlcF93
YXlsYW5kX3NjYW5uZXIgPSBkZXBlbmRlbmN5KApAQCAtMjQsNCArMjUsNCBAQCBpbmRleCAwYmI2
MTI4Li4wYjZkYTFmIDEwMDY0NAogKyAgICAnd2F5bGFuZC1zY2FubmVyJywgdmVyc2lvbiA6ICc+
PSAxLjE1JywgcmVxdWlyZWQgOiBnZXRfb3B0aW9uKCd3YXlsYW5kJyksIG5hdGl2ZTogdHJ1ZSwK
ICAgICkKICAgIGlmIGRlcF93YXlsYW5kX3NjYW5uZXIuZm91bmQoKQotICAgICBwcm9nX3dheWxh
bmRfc2Nhbm5lciA9IGZpbmRfcHJvZ3JhbShkZXBfd2F5bGFuZF9zY2FubmVyLmdldF9wa2djb25m
aWdfdmFyaWFibGUoJ3dheWxhbmRfc2Nhbm5lcicpKQorICAgICBwcm9nX3dheWxhbmRfc2Nhbm5l
ciA9IGZpbmRfcHJvZ3JhbShkZXBfd2F5bGFuZF9zY2FubmVyLmdldF92YXJpYWJsZShwa2djb25m
aWc6ICd3YXlsYW5kX3NjYW5uZXInKSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YWZmbGUvd2FmZmxlLzAwMDEtd2FmZmxlLWRvLW5vdC1tYWtlLWNvcmUtcHJvdG9jb2wtaW50
by10aGUtbGlicmFyeS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxl
LzAwMDEtd2FmZmxlLWRvLW5vdC1tYWtlLWNvcmUtcHJvdG9jb2wtaW50by10aGUtbGlicmFyeS5w
YXRjaAppbmRleCAyNGIyZGU1ZDljLi5lOTAwNTQxN2NkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZS8wMDAxLXdhZmZsZS1kby1ub3QtbWFrZS1jb3JlLXBy
b3RvY29sLWludG8tdGhlLWxpYnJhcnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3dhZmZsZS93YWZmbGUvMDAwMS13YWZmbGUtZG8tbm90LW1ha2UtY29yZS1wcm90b2NvbC1pbnRv
LXRoZS1saWJyYXJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3NjEwZWM0YjU3MmQzYTU0
ZDMwZmNhNjc5OGYwYzQwNmYzZmQ4YTQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
NTM4NzVmZGJkNDc3MjVhMTMwYjM2ZTUxYWM4MTViNDc0N2Q5ZGJiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERh
dGU6IFR1ZSwgMjYgT2N0IDIwMjEgMDg6NTI6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gd2Fm
ZmxlOiBkbyBub3QgbWFrZSBjb3JlIHByb3RvY29sIGludG8gdGhlIGxpYnJhcnkKQEAgLTksMjgg
KzksMTMgQEAgd2F5bGFuZC54bWwgZnJvbSB0aGUgaG9zdC4KIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KKwogLS0tCi0gbWVzb24uYnVpbGQgICAgICAg
ICAgICB8IDQgLS0tLQogIHNyYy93YWZmbGUvbWVzb24uYnVpbGQgfCA3IC0tLS0tLS0KLSAyIGZp
bGVzIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQorIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQogCi1kaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZmZj
MDJmZi4uMGJiNjEyOCAxMDA2NDQKLS0tLSBhL21lc29uLmJ1aWxkCi0rKysgYi9tZXNvbi5idWls
ZAotQEAgLTEwNCwxMCArMTA0LDYgQEAgZWxzZQotICAgZGVwX3dheWxhbmRfY2xpZW50ID0gZGVw
ZW5kZW5jeSgKLSAgICAgJ3dheWxhbmQtY2xpZW50JywgdmVyc2lvbiA6ICc+PSAxLjEwJywgcmVx
dWlyZWQgOiBnZXRfb3B0aW9uKCd3YXlsYW5kJyksCi0gICApCi0tICBpZiBkZXBfd2F5bGFuZF9j
bGllbnQuZm91bmQoKQotLSAgICB3YXlsYW5kX2NvcmVfeG1sID0gam9pbl9wYXRocyhkZXBfd2F5
bGFuZF9jbGllbnQuZ2V0X3BrZ2NvbmZpZ192YXJpYWJsZSgncGtnZGF0YWRpcicpLAotLSAgICAn
d2F5bGFuZC54bWwnKQotLSAgZW5kaWYKLSAgIGRlcF93YXlsYW5kX2VnbCA9IGRlcGVuZGVuY3ko
Ci0gICAgICd3YXlsYW5kLWVnbCcsIHZlcnNpb24gOiAnPj0gOS4xJywgcmVxdWlyZWQgOiBnZXRf
b3B0aW9uKCd3YXlsYW5kJyksCi0gICApCiBkaWZmIC0tZ2l0IGEvc3JjL3dhZmZsZS9tZXNvbi5i
dWlsZCBiL3NyYy93YWZmbGUvbWVzb24uYnVpbGQKLWluZGV4IDAxODk4YzguLjYyNDU4NjggMTAw
NjQ0CitpbmRleCBlMjYzNmM3Li4zZmY1NzYyIDEwMDY0NAogLS0tIGEvc3JjL3dhZmZsZS9tZXNv
bi5idWlsZAogKysrIGIvc3JjL3dhZmZsZS9tZXNvbi5idWlsZAogQEAgLTg4LDEyICs4OCw2IEBA
IGlmIGJ1aWxkX3N1cmZhY2VsZXNzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2FmZmxlL3dhZmZsZV8xLjcuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2Fm
ZmxlXzEuNy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjcuMi5iYgppbmRleCBkYzQ3NTkwOGQwLi5mYjg4NTUy
OWQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjcu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjcuMi5iYgpA
QCAtOSwxMSArOSwxMSBAQCBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT00YzUxNTQ0MDdjMjQ5MDc1MGRkNDYxYzUwYWQ5
NDc5NyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9pbmNsdWRlL3dhZmZsZS0xL3dhZmZs
ZS5oO2VuZGxpbmU9MjQ7bWQ1PTYxZGJmODY5N2Y2MWM3ODY0NWU3NWE5M2M1ODViMWJmIgogCi1T
UkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS93YWZmbGUuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL21lc2Evd2FmZmxlLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbnQt
MS43IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtd2FmZmxlLWRvLW5vdC1tYWtlLWNvcmUtcHJv
dG9jb2wtaW50by10aGUtbGlicmFyeS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1l
c29uLmJ1aWxkLXJlcXVlc3QtbmF0aXZlLXdheWxhbmQtc2Nhbm5lci5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ1JFViA9ICI5MDVjNmMxMGYyNDgzYWRmMGNiZmEwMjRlMmQzYzJlZDU0MWZiMzAw
IgorU1JDUkVWID0gImYzYjQyYTcyMTYxMDU0OTg4NDJiYzZiYTc3ZDg0ODFiOTBkNmY1ZjkiCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0IG1lc29uIGZlYXR1cmVzX2NoZWNrIGxpYl9w
YWNrYWdlIGJhc2gtY29tcGxldGlvbiBwa2djb25maWcKLS0gCjIuMzkuMgoK

--===============5782899776027651897==--

