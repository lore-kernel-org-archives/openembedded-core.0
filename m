Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DF9CA9EC9
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107437.1682976352354148522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YAsf9OdG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d93529c7-00e6effa-9c17-4660-9c56-e4df09e12417-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ka/9R20Fw9UvMsNoyAQNOXnXYZ67c8ixxlPf2zPYg/I=;
	b=YAsf9OdG3WsD9RWXtc4AQHYdKY+WrdgFCqaxZV+XAycQbbQ9hcODeWHBjeQMlAJf
	Ntbj3gfiGTwyjyWab0PYHJwwG60aqy8aKhmESDe+P4KEbGRSvn5AUUrle1NKzQynyqB
	w1N3X6n0jOTyCYWN/YnXiuXLGeQpG2Ok4rgT9lDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ka/9R20Fw9UvMsNoyAQNOXnXYZ67c8ixxlPf2zPYg/I=;
	b=Kmz9uL/ZfZPvfb8qA4AqlfxQq5GxlQoQkAgFgJJBaGwFKo6PszujooZPj4odVZDA
	7MLBvh/oc5Sm9GUR+0L6xisy6S0R9if+/nNMARlUr4GWrkcSDuP95Cc9cJJL7uCb6dR
	LW+yePe4UeaB537Pu0m8RCDKsrZ1w5uMh5HzLob4=
Content-Type: multipart/mixed; boundary="===============4800816405757939059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.7.2 FAILED
Message-ID: <01010187d93529c7-00e6effa-9c17-4660-9c56-e4df09e12417-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180662

--===============4800816405757939059==
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
--===============4800816405757939059==
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
meta-yocto-bsp       = "tmp-auh-upgrades:a522f7a36223c1c4ae783f2fd87fb843542f9711"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 150 Local 143 Mirrors 0 Missed 7 Current 322 (95% match, 98% complete)
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
NOTE: Running task 1686 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_lic)
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
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
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuil
 d/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:na
 tive:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'python3', 'qemu-native', 'quilt-native', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxcb', 'bash-completion', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'wayland-native', 'libxml2', 'libffi', 'expat', 'xtrans', 'util-macros', 'xorgproto', 'autoconf-archive', 'libgcc', 'linux-libc-headers', 'libcap', 'zstd', 'libseccomp', 'libpam', 'base-files', 'util-linux', 'shadow-native', 'acl', 'update-rc.d', 'shadow', 'shadow-sysroot', 'base-passwd', 'opkg-utils', 'initscripts', 'kmod', 'libxkbcommon', 're2c-native', 'xrandr', 'libxshmfence', 'vulkan-loader', 'libxfixes', 'libxext', 'libdrm', 'libxxf86vm', 'libxdamage', 'zlib', 'vulkan-headers', 'libffi-native', 'xz-native', 'libxml2-native', 'expat-native', 'texinfo-dummy-native', 'zlib-native', 'gnu-config-native', 'mpfr-native', 'libtool-native', 'zstd-nativ
 e', 'binutils-cross-i686', 'libmpc-native', 'gmp-native', 'flex-native', 'glib-2.0-native', 'openssl-native', 'readline-native', 'libnsl2-native', 'gdbm-native', 'util-linux-libuuid-native', 'ncurses-native', 'libtirpc-native', 'bzip2-native', 'sqlite3-native', 'attr-native', 'python3-installer-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'libpthread-stubs', 'libxdmcp', 'xcb-proto', 'libxau', 'libtirpc', 'xz', 'openssl', 'util-linux-libuuid', 'bzip2', 'libxcrypt', 'readline', 'sqlite3', 'gdbm', 'libnsl2', 'ncurses', 'cracklib', 'libcap-ng', 'attr', 'xkeyboard-config', 'libxrandr', 'libxrender', 'libpciaccess', 'gettext-minimal-native', 'm4-native', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'perl-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libcap-ng-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing subdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.4.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.3.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.3.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing subdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.0.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.1.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.3.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.3.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.1.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.7.2.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.4.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.3.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.4.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.5.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.2.1.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-0.2.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.6.3.md to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
| Installing /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/git/doc/release-notes/waffle-1.0.0.txt to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image/usr/share/doc/waffle1/release-notes
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.2225581:153 exit 2 from 'sed -i -e "s,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0,,g" /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/image//usr/lib/cmake/Waffle/WaffleConfig.cmake'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.2225581, line 153
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.2225581, line 162
NOTE: recipe waffle-1.7.2-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1689 tasks of which 1679 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: waffle-1.7.2-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/run.do_install.2225581', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/waffle/1.7.2-r0/temp/log.do_install.2225581
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install) failed with exit code '1'

--===============4800816405757939059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-waffle-upgrade-1.7.0-1.7.2.patch"

RnJvbSA3N2VlODhmYjdiNGI0OTc4Y2QzNGY1OTQzNzg5ZmIxNmFiM2U2ODc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODozNjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
ZmZsZTogdXBncmFkZSAxLjcuMCAtPiAxLjcuMgoKLS0tCiAuLi5idWlsZC1yZXF1ZXN0LW5hdGl2
ZS13YXlsYW5kLXNjYW5uZXIucGF0Y2ggfCAgOSArKysrLS0tLQogLi4uLW1ha2UtY29yZS1wcm90
b2NvbC1pbnRvLXRoZS1saWJyYXJ5LnBhdGNoIHwgMjMgKysrKy0tLS0tLS0tLS0tLS0tLQogLi4u
L3t3YWZmbGVfMS43LjAuYmIgPT4gd2FmZmxlXzEuNy4yLmJifSAgICAgIHwgIDQgKystLQogMyBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3t3YWZmbGVfMS43LjAuYmIgPT4gd2FmZmxlXzEu
Ny4yLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUv
d2FmZmxlLzAwMDEtbWVzb24uYnVpbGQtcmVxdWVzdC1uYXRpdmUtd2F5bGFuZC1zY2FubmVyLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZmbGUvMDAwMS1tZXNvbi5idWls
ZC1yZXF1ZXN0LW5hdGl2ZS13YXlsYW5kLXNjYW5uZXIucGF0Y2gKaW5kZXggMWI2MmRiOTJlOS4u
NGIzYTBlN2M0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZm
bGUvMDAwMS1tZXNvbi5idWlsZC1yZXF1ZXN0LW5hdGl2ZS13YXlsYW5kLXNjYW5uZXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZmbGUvMDAwMS1tZXNvbi5idWls
ZC1yZXF1ZXN0LW5hdGl2ZS13YXlsYW5kLXNjYW5uZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDIxOTVjZWMxZTViYzY2MTI4ZDcyMDQ5YzExZmYzODFjYTQ1MTZhNGIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDA5NjE3ODdkMmJmMGQzNTlhM2VhZDg5ZTljZWM2NDI4MThiMzJk
ZWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogRGF0ZTogVHVlLCA1IEp1bCAyMDIyIDExOjUxOjM5ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiByZXF1ZXN0IG5hdGl2ZSB3YXlsYW5kLXNjYW5u
ZXIKQEAgLTgsMTUgKzgsMTYgQEAgdHJ5IHRvIHVzZSBhIGNyb3NzLWJpbmFyeSwgYW5kIGZhaWwu
CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvbWVzYS93YWZmbGUvLS9tZXJnZV9yZXF1ZXN0cy8xMTBdCiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgorCiAtLS0KICBtZXNvbi5idWls
ZCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDBiYjYxMjgu
LjBiNmRhMWYgMTAwNjQ0CitpbmRleCBjYTZhMjEyLi4zMTc3YmRlIDEwMDY0NAogLS0tIGEvbWVz
b24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMTA4LDcgKzEwOCw3IEBAIGVsc2UKK0BA
IC0xMTAsNyArMTEwLDcgQEAgZWxzZQogICAgICAnd2F5bGFuZC1lZ2wnLCB2ZXJzaW9uIDogJz49
IDkuMScsIHJlcXVpcmVkIDogZ2V0X29wdGlvbignd2F5bGFuZCcpLAogICAgKQogICAgZGVwX3dh
eWxhbmRfc2Nhbm5lciA9IGRlcGVuZGVuY3koCkBAIC0yNCw0ICsyNSw0IEBAIGluZGV4IDBiYjYx
MjguLjBiNmRhMWYgMTAwNjQ0CiArICAgICd3YXlsYW5kLXNjYW5uZXInLCB2ZXJzaW9uIDogJz49
IDEuMTUnLCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3dheWxhbmQnKSwgbmF0aXZlOiB0cnVlLAog
ICAgKQogICAgaWYgZGVwX3dheWxhbmRfc2Nhbm5lci5mb3VuZCgpCi0gICAgIHByb2dfd2F5bGFu
ZF9zY2FubmVyID0gZmluZF9wcm9ncmFtKGRlcF93YXlsYW5kX3NjYW5uZXIuZ2V0X3BrZ2NvbmZp
Z192YXJpYWJsZSgnd2F5bGFuZF9zY2FubmVyJykpCisgICAgIHByb2dfd2F5bGFuZF9zY2FubmVy
ID0gZmluZF9wcm9ncmFtKGRlcF93YXlsYW5kX3NjYW5uZXIuZ2V0X3ZhcmlhYmxlKHBrZ2NvbmZp
ZzogJ3dheWxhbmRfc2Nhbm5lcicpKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3dhZmZsZS93YWZmbGUvMDAwMS13YWZmbGUtZG8tbm90LW1ha2UtY29yZS1wcm90b2NvbC1pbnRv
LXRoZS1saWJyYXJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZmbGUv
MDAwMS13YWZmbGUtZG8tbm90LW1ha2UtY29yZS1wcm90b2NvbC1pbnRvLXRoZS1saWJyYXJ5LnBh
dGNoCmluZGV4IDI0YjJkZTVkOWMuLjYwZTYzMThmN2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy93YWZmbGUvd2FmZmxlLzAwMDEtd2FmZmxlLWRvLW5vdC1tYWtlLWNvcmUtcHJv
dG9jb2wtaW50by10aGUtbGlicmFyeS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2FmZmxlL3dhZmZsZS8wMDAxLXdhZmZsZS1kby1ub3QtbWFrZS1jb3JlLXByb3RvY29sLWludG8t
dGhlLWxpYnJhcnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc2MTBlYzRiNTcyZDNhNTRk
MzBmY2E2Nzk4ZjBjNDA2ZjNmZDhhNDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcx
ZjkzOTlkNmNlYTFlMmU4ODVhOThiOThkODJlYjYyODgzMmE4NmUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0
ZTogVHVlLCAyNiBPY3QgMjAyMSAwODo1MjoxNyArMDIwMAogU3ViamVjdDogW1BBVENIXSB3YWZm
bGU6IGRvIG5vdCBtYWtlIGNvcmUgcHJvdG9jb2wgaW50byB0aGUgbGlicmFyeQpAQCAtOSwyOCAr
OSwxMyBAQCB3YXlsYW5kLnhtbCBmcm9tIHRoZSBob3N0LgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgorCiAtLS0KLSBtZXNvbi5idWlsZCAgICAgICAg
ICAgIHwgNCAtLS0tCiAgc3JjL3dhZmZsZS9tZXNvbi5idWlsZCB8IDcgLS0tLS0tLQotIDIgZmls
ZXMgY2hhbmdlZCwgMTEgZGVsZXRpb25zKC0pCisgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25z
KC0pCiAKLWRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBmZmMw
MmZmLi4wYmI2MTI4IDEwMDY0NAotLS0tIGEvbWVzb24uYnVpbGQKLSsrKyBiL21lc29uLmJ1aWxk
Ci1AQCAtMTA0LDEwICsxMDQsNiBAQCBlbHNlCi0gICBkZXBfd2F5bGFuZF9jbGllbnQgPSBkZXBl
bmRlbmN5KAotICAgICAnd2F5bGFuZC1jbGllbnQnLCB2ZXJzaW9uIDogJz49IDEuMTAnLCByZXF1
aXJlZCA6IGdldF9vcHRpb24oJ3dheWxhbmQnKSwKLSAgICkKLS0gIGlmIGRlcF93YXlsYW5kX2Ns
aWVudC5mb3VuZCgpCi0tICAgIHdheWxhbmRfY29yZV94bWwgPSBqb2luX3BhdGhzKGRlcF93YXls
YW5kX2NsaWVudC5nZXRfcGtnY29uZmlnX3ZhcmlhYmxlKCdwa2dkYXRhZGlyJyksCi0tICAgICd3
YXlsYW5kLnhtbCcpCi0tICBlbmRpZgotICAgZGVwX3dheWxhbmRfZWdsID0gZGVwZW5kZW5jeSgK
LSAgICAgJ3dheWxhbmQtZWdsJywgdmVyc2lvbiA6ICc+PSA5LjEnLCByZXF1aXJlZCA6IGdldF9v
cHRpb24oJ3dheWxhbmQnKSwKLSAgICkKIGRpZmYgLS1naXQgYS9zcmMvd2FmZmxlL21lc29uLmJ1
aWxkIGIvc3JjL3dhZmZsZS9tZXNvbi5idWlsZAotaW5kZXggMDE4OThjOC4uNjI0NTg2OCAxMDA2
NDQKK2luZGV4IGUyNjM2YzcuLjNmZjU3NjIgMTAwNjQ0CiAtLS0gYS9zcmMvd2FmZmxlL21lc29u
LmJ1aWxkCiArKysgYi9zcmMvd2FmZmxlL21lc29uLmJ1aWxkCiBAQCAtODgsMTIgKzg4LDYgQEAg
aWYgYnVpbGRfc3VyZmFjZWxlc3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93
YWZmbGUvd2FmZmxlXzEuNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZm
bGVfMS43LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3dhZmZsZS93YWZmbGVfMS43LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNy4yLmJiCmluZGV4IGRjNDc1OTA4ZDAuLmZiODg1NTI5
ZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNy4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNy4yLmJiCkBA
IC05LDExICs5LDExIEBAIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTRjNTE1NDQwN2MyNDkwNzUwZGQ0NjFjNTBhZDk0
Nzk3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2luY2x1ZGUvd2FmZmxlLTEvd2FmZmxl
Lmg7ZW5kbGluZT0yNDttZDU9NjFkYmY4Njk3ZjYxYzc4NjQ1ZTc1YTkzYzU4NWIxYmYiCiAKLVNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3dhZmZsZS5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCitTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvbWVzYS93YWZmbGUuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWludC0x
LjcgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS13YWZmbGUtZG8tbm90LW1ha2UtY29yZS1wcm90
b2NvbC1pbnRvLXRoZS1saWJyYXJ5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVz
b24uYnVpbGQtcmVxdWVzdC1uYXRpdmUtd2F5bGFuZC1zY2FubmVyLnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDUkVWID0gIjkwNWM2YzEwZjI0ODNhZGYwY2JmYTAyNGUyZDNjMmVkNTQxZmIzMDAi
CitTUkNSRVYgPSAiZjNiNDJhNzIxNjEwNTQ5ODg0MmJjNmJhNzdkODQ4MWI5MGQ2ZjVmOSIKIFMg
PSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVzb24gZmVhdHVyZXNfY2hlY2sgbGliX3Bh
Y2thZ2UgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwotLSAKMi4zOS4yCgo=

--===============4800816405757939059==--

