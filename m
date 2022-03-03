Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70178C3527D
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.13957.1646329345495186266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MhgxLSgR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017f50e0322d-e5dd30a4-59ed-47d0-b13a-e4ae787f2d1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=b8QuxX4fyO+UlZiZ5PRn+8+TIZJX7/MIyVd+OsaiutM=;
	b=MhgxLSgR50hmJzPPQiYN7HoThjiJt836pqLeaar6/6d2mNEv8DHjixO8aeeaWuWw
	Q6YxsSK6BnH4F41IGguJ1oVn9UEnrbYcK9BC3+ANg6IkoCIr1n/Ut3QGs7g+0hQ+208
	uDRXNisOZIxFjWYEh7NluYU8oJd4h7L1K8T1T4UU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=b8QuxX4fyO+UlZiZ5PRn+8+TIZJX7/MIyVd+OsaiutM=;
	b=k9X8uoTvw/cTP9Gjtbqs7vnpbuqCD5blsMFNJ6eMbPH3Bby+tnIeU2kk503hsLVG
	sDvqcTw8E8e5eGXz4djvmM80nRRobSbkGrkTsJmiKG2x09gsgRW1gT7hTwTkNM9TKDq
	sGoVwmPr+0uWdE3rjEfKET08xnWohfGI2ZsExuXc=
Content-Type: multipart/mixed; boundary="===============8660203721223998954=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.0 FAILED
Message-ID: 
 <0101017f50e0322d-e5dd30a4-59ed-47d0-b13a-e4ae787f2d1a-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162693

--===============8660203721223998954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-21.1.4-22.1.0.patch
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
--===============8660203721223998954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-81a7e08b7e52b2af495e3e414dd163708595b9b5"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:81a7e08b7e52b2af495e3e414dd163708595b9b5"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 111 Mirrors 0 Missed 7 Current 318 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1468 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_fetch)
NOTE: Running task 1530 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_write_config)
NOTE: recipe xwayland-22.1.0-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.0-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_unpack)
NOTE: Running task 1549 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.0-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.0-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_patch)
NOTE: recipe xwayland-22.1.0-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_populate_lic)
NOTE: recipe xwayland-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xwayland-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1553 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_configure)
NOTE: recipe xwayland-22.1.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pa
 tch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.b
 b:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.61.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo
 _git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['xorgproto', 'python3-native', 'quilt-native', 'ninja-native', 'libdrm', 'pixman', 'libx11', 'patch-native', 'wayland', 'gcc-cross-i686', 'glibc', 'wayland-protocols', 'openssl', 'pkgconfig-native', 'libepoxy', 'gcc-runtime', 'meson-native', 'xtrans', 'wayland-native', 'xz-native', 'qemu-native', 'libxfont2', 'mesa', 'pseudo-native', 'libxkbfile', 're2c-native', 'libpthread-stubs', 'libpciaccess', 'libtool-native', 'libffi-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'libnsl2-native', 'util-linux-native', 'openssl-native', 'libtirpc-native', 'gdbm-native', 'zlib-native', 'libxcb', 'util-macros', 'autoconf-archive', 'zlib', 'attr-native', 'libxml2', 'libffi', 'expat', 'gnu-config-native', 'texinfo-dummy-native', 'flex-native', 'mpfr-native', 'libmpc-native', 'gmp-native', 'linux-libc-headers', 'binutils-cross-i686', 'opkg-utils', 'libgcc', 'python3-wheel-native', 'python3-pip-native', 'python3-setuptools-native', 'expat-
 native', 'libxml2-native', 'gettext-minimal-native', 'glib-2.0-native', 'libfontenc', 'freetype', 'libxshmfence', 'libxxf86vm', 'xrandr', 'libxext', 'libxfixes', 'libxdamage', 'ncurses-native', 'libcap-ng-native', 'libpcre2-native', 'util-linux-libuuid-native', 'perl-native', 'libxdmcp', 'xcb-proto', 'libxau', 'python3', 'm4-native', 'python3-flit-core-native', 'unzip-native', 'cmake-native', 'gettext-native', 'gtk-doc-native', 'libpcre-native', 'font-util', 'libpng', 'libxrandr', 'libxrender', 'perlcross-native', 'bzip2', 'util-linux', 'libxcrypt', 'libtirpc', 'libnsl2', 'sqlite3', 'readline', 'gdbm', 'xz', 'zstd-native', 'curl-native', 'encodings', 'ncurses', 'libpam', 'util-linux-libuuid', 'bash-completion', 'libcap-ng', 'cracklib', 'flex']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddri3=true -Dglamor=true -Dglx=true -Dsha1=libcrypto -Dlibunwind=false -Dxinerama=false...
| The Meson build system
| Version: 0.61.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/xwayland-22.1.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/build
| Build type: cross build
| Project name: xwayland
| Project version: 22.1.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/recipe-sysroot (gcc 11.2.0 "i686-poky-linux-gcc (GCC) 11.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/recipe-sysroot ld.bfd 2.38.20220210
| C compiler for the build machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-4)")
| C linker for the build machine: gcc ld.bfd 2.30-108
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports arguments -Wall: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wbad-function-cast: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Werror=implicit: YES
| Compiler for C supports arguments -Werror=nonnull: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=main: YES
| Compiler for C supports arguments -Werror=missing-braces: YES
| Compiler for C supports arguments -Werror=sequence-point: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=trigraphs: YES
| Compiler for C supports arguments -Werror=array-bounds: YES
| Compiler for C supports arguments -Werror=write-strings: YES
| Compiler for C supports arguments -Werror=address: YES
| Compiler for C supports arguments -Werror=int-to-pointer-cast: YES
| Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
| ../xwayland-22.1.0/meson.build:61: WARNING: Consider using the built-in warning_level option instead of using "-Wall".
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency xproto found: YES 7.0.33
| Run-time dependency randrproto found: YES 1.6.0
| Run-time dependency renderproto found: YES 0.11.1
| Run-time dependency xextproto found: YES 7.3.0
| Run-time dependency inputproto found: YES 2.3.99.2
| Run-time dependency kbproto found: YES 1.0.7
| Run-time dependency fontsproto found: YES 2.1.3
| Run-time dependency fixesproto found: YES 6.0
| Run-time dependency damageproto found: YES 1.2.1
| Run-time dependency xcmiscproto found: YES 1.2.2
| Run-time dependency bigreqsproto found: YES 1.1.2
| Run-time dependency xtrans found: YES 1.4.0
| Run-time dependency videoproto found: YES 2.3.3
| Run-time dependency compositeproto found: YES 0.4.2
| Run-time dependency recordproto found: YES 1.14.2
| Run-time dependency scrnsaverproto found: YES 1.2.3
| Run-time dependency resourceproto found: YES 1.2.0
| Run-time dependency dri3proto found: YES 1.2
| Run-time dependency xineramaproto found: YES 1.2.1
| Run-time dependency xf86bigfontproto found: YES 1.2.0
| Run-time dependency xf86vidmodeproto found: YES 2.3.1
| Run-time dependency xshmfence found: YES 1.3
| Run-time dependency pixman-1 found: YES 0.40.0
| Found CMake: NO
| Run-time dependency libbsd found: NO (tried pkgconfig and cmake)
| Run-time dependency xkbcomp found: NO (tried pkgconfig and cmake)
| Run-time dependency xkbfile found: YES 1.1.0
| Run-time dependency xfont2 found: YES 2.0.5
| Run-time dependency fontutil found: YES 1.3.2
| Run-time dependency wayland-client found: YES 1.20.0
| Run-time dependency wayland-protocols found: YES 1.25
| Run-time dependency libxcvt found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency libxcvt
| 
| ../xwayland-22.1.0/meson.build:165:0: ERROR: Neither a subproject directory nor a libxcvt.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448:187 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448, line 187
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448, line 176
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448, line 200
NOTE: recipe xwayland-22.1.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1553 tasks of which 1545 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xwayland-22.1.0-r0 do_configure: meson failed
ERROR: xwayland-22.1.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/run.do_configure.502448', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/xwayland/22.1.0-r0/temp/log.do_configure.502448
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb:do_configure) failed with exit code '1'

--===============8660203721223998954==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-21.1.4-22.1.0.patch"

From 9154032461ccb8fa5456fc64c0e074e98b60fac8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 16:40:09 +0000
Subject: [PATCH] xwayland: upgrade 21.1.4 -> 22.1.0

---
 .../xwayland/{xwayland_21.1.4.bb => xwayland_22.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.4.bb => xwayland_22.1.0.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
index e08be51ce7..921086dbfa 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "19f6795f31cfa8eb352b1e5b3c379f22ee6020e98701ff2cc679da8c4f1159f7"
+SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.27.0


--===============8660203721223998954==--

