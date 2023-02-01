Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184FDC6FA99
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.30018.1675272857985470049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iRPLAObk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b2ac2-f8edb18b-5cc1-46b0-8cc6-be2ba0a2135d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6rJ7nQlrmbZONLT1UsiKmQFG3L0uJexbYcAxlDphkQY=;
	b=iRPLAObkKDH6KJ5tAf64YICOOHFhUdLuIOVHTBu4bD+WghLejBewANalpG84j+Lj
	i5nfCRIRt7ntXNal1bJcKEadB7iGnQxRAclE+HqQEJHa3I0Vb4HfKLmfDysNWYNN5Mc
	OA/ntqRsEIpm4QHIZZz4COOq9EffD2TKIaATTW2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6rJ7nQlrmbZONLT1UsiKmQFG3L0uJexbYcAxlDphkQY=;
	b=fB4QTZfjKsfb/QGXthbSEHanw22MG6E8MU4nYkmovfTj8i8tEykNJGsxTlGuhajf
	Be2zhIC7nOgnNWfE+JEOsIYzYZ9vzwteYsC0S5kARiZY+5tOimHEK6EMNjaGJK0ulLH
	09updvj85HLWj5TQaR5ZUCAxfwThqOl8RHZRlfJw=
Content-Type: multipart/mixed; boundary="===============3087260210918110478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-base: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b2ac2-f8edb18b-5cc1-46b0-8cc6-be2ba0a2135d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176638

--===============3087260210918110478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-base* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-upgrade-1.20.5-1.22.0.patch
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
--===============3087260210918110478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e687488b717009bde185ad62d8873a114be4e30"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 142 Local 135 Mirrors 0 Missed 7 Current 366 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1663 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1761 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1783 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 1784 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1785 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1786 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1787 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1788 of 1796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worke
 r/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/bui
 ld/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/m
 eta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:na
 tive:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'util-linux', 'zlib', 'gcc-cross-i686', 'gcc-runtime', 'orc', 'qemu-native', 'quilt-native', 'gobject-introspection', 'libdrm', 'libjpeg-turbo', 'mesa', 'pango', 'wayland-protocols', 'wayland', 'libsm', 'libx11', 'libxrender', 'libxv', 'alsa-lib', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'iso-codes', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'wayland-native', 'texinfo-dummy-native', 'gettext-minimal-native', 'libtool-native', 'glib-2.0', 'libxml2', 'libxext', 'xorgproto', 'util-macros', 'libxxf86vm', 'libxfixes', 'libxshmfence', 'vulkan-headers', 'xrandr', 'libxdamage', 'expat', 'vulkan-loader', 'autoconf-archive', 'libxcb', 'xtrans', 'util-linux-libuuid', 'libpam', 'ncurses', 'libxcrypt', 'opkg-utils', 'libcap-ng', 'bash-completion', 'linux-libc-header
 s', 'gmp-native', 'gnu-config-native', 'flex-native', 'mpfr-native', 'libmpc-native', 'zstd-native', 'binutils-cross-i686', 'zlib-native', 'libpthread-stubs', 'libpciaccess', 'python3', 'libffi', 'libgcc', 'libxft', 'fribidi', 'freetype', 'cairo', 'fontconfig', 'harfbuzz', 're2c-native', 'libffi-native', 'openssl-native', 'libnsl2-native', 'sqlite3-native', 'util-linux-libuuid-native', 'bzip2-native', 'libtirpc-native', 'readline-native', 'ncurses-native', 'gdbm-native', 'libxml2-native', 'expat-native', 'attr-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'libice', 'util-linux-native', 'libpcre2-native', 'libpcre2', 'libxrandr', 'libxau', 'libxdmcp', 'xcb-proto', 'cracklib', 'flex', 'm4-native', 'bzip2', 'libtirpc', 'sqlite3', 'xz', 'gdbm', 'readline', 'openssl', 'libnsl2', 'pixman', 'icu', 'perl-native', 'cmake-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'libca
 p-ng-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=gles2 -Dgl_platform=egl -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/gst-plugins-base-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/build
| Build type: cross build
| Project name: gst-plugins-base
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-g++ (GCC) 12.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "emmintrin.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "process.h" : NO
| Has header "smmintrin.h" : YES
| Has header "stdint.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/wait.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Has header "xmmintrin.h" : YES
| Has header "linux/dma-buf.h" : YES
| Library m found: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "gmtime_r" with dependency -lm: YES
| Checking for function "localtime_r" with dependency -lm: YES
| Checking for function "lrintf" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "log2" with dependency -lm: YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Compiler for C++ supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency x11 found: YES 1.8.3
| Run-time dependency gio-2.0 found: YES 2.74.4
| Run-time dependency gio-unix-2.0 found: YES 2.74.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.74.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-base-1.22.0/meson.build:357:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545, line 179
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545, line 168
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545, line 192
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1788 tasks of which 1780 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/run.do_configure.1706545', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_configure.1706545
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure) failed with exit code '1'

--===============3087260210918110478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-upgrade-1.20.5-1.22.0.patch"

RnJvbSAxMjZkMDU2ODEzZGI2OGViYzhmMWJiMTRjZDAzYmRjYzQ3MzQ1NGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjoyNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2U6IHVwZ3JhZGUgMS4yMC41IC0+IDEuMjIuMAoKLS0tCiAu
Li51Z2lucy1iYXNlXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjIu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2VfMS4yMC41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4y
Mi4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjAuNS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjIuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjIwLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
XzEuMjIuMC5iYgppbmRleCBjMzdiNTQyYzU3Li4wMWVmNjNjMTA0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjIwLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2VfMS4yMi4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dz
dC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJz
ZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFmOTExZWY2NWYzMDk1ZDdjZjY5OGExYWQxZmM1MjQyYWMz
YWQ2YzkyNzA0NjVmYjVjOWU3ZjRmOWMxOWIzNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTM2
NzIyOTRmMzk4NWQ1NjM1NWM4YjFkZjhmNmI0OWM4Yzg3MjExMDY1NjNlMTlmNTNiZTM1MDdmZjIy
MjlkIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIAotLSAKMi4z
Ny4zCgo=

--===============3087260210918110478==--

