Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12527.1602843683710868102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8B6A438C162E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.18.0 FAILED
Message-ID: <MADEUP.163E71D742EAD708.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143494
Content-Type: multipart/mixed; boundary="===============1899220550642760307=="

--===============1899220550642760307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.16.2-1.18.0.patch
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

--===============1899220550642760307==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.16.2-1.18.0.patch"

From 3fb3c6774d05ec9ca4cb52b3e91185ff47d6a5be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:29:53 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.16.2 -> 1.18.0

---
 ...gins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
index be10800389..77f760a635 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
@@ -9,8 +9,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.18.4


--===============1899220550642760307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1470 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a205895e9dbe37f8f994854d745bb94b9ad6b3bd"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 182 Found 175 Missed 7 Current 640 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_unpack)
NOTE: Running task 2140 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_write_config)
NOTE: Running task 2141 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2526 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2527 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2528 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2529 of 2537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_configure: Started
ERROR: gstreamer1.0-plugins-ugly-1.18.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-ugly-1.18.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/gst-plugins-ugly-1.18.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Project name: gst-plugins-ugly
Project version: 1.18.0
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-73
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
WARNING: Project targeting '>= 0.48' but tried to use feature introduced in '0.54.0': native arg in add_languages.
C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES 
Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES 
Has header "dlfcn.h" : YES 
Has header "inttypes.h" : YES 
Has header "malloc.h" : YES 
Has header "memory.h" : YES 
Has header "stdint.h" : YES 
Has header "stdlib.h" : YES 
Has header "strings.h" : YES 
Has header "string.h" : YES 
Has header "sys/stat.h" : YES 
Has header "sys/types.h" : YES 
Has header "unistd.h" : YES 
Has header "winsock2.h" : NO 
Checking for function "dcgettext" : YES 
Checking for size of "char" : 1
Checking for size of "int" : 4
Checking for size of "long" : 4
Checking for size of "short" : 2
Checking for size of "void*" : 4
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
Found CMake: NO
Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency gstreamer-1.0

../gst-plugins-ugly-1.18.0/meson.build:119:0: ERROR: Subproject directory not found and gstreamer.wrap file not found

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124:186 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 186
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 166
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 151
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 206

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/log.do_configure.3922124
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc
 /orc_0.4.31.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/bui
 ld/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['orc', 'mpeg2dec', 'xz-native', 'pseudo-native', 'gettext-native', 'patch-native', 'liba52', 'orc-native', 'meson-native', 'pkgconfig-native', 'quilt-native', 'gstreamer1.0-plugins-base', 'gcc-runtime', 'gstreamer1.0', 'glib-2.0-native', 'gcc-cross-i686', 'python3-native', 'glibc', 'ninja-native', 'libxext', 'libx11', 'libxv', 'autoconf-native', 'gettext-minimal-native', 'automake-native', 'libtool-native', 'gnu-config-native', 'texinfo-dummy-native', 'gtk-doc-native', 'python3-setuptools-native', 'attr-native', 'libvorbis', 'wayland', 'libtheora', 'wayland-protocols', 'libxrender', 'mesa', 'libogg', 'libpng', 'libdrm', 'alsa-lib', 'libjpeg-turbo', 'zlib', 'iso-codes', 'gobject-introspection', 'util-linux', 'libsm', 'pango', 'linux-libc-headers', 'libgcc', 'libxml2', 'glib-2.0', 'libcap', 'zlib-native', 'libffi-native', 'libpcre-native', 'util-linux-native', 'binutils-cross-i686', 'mpfr-native', 'gmp-native', 'flex-native', 'libmpc-nati
 ve', 'libtirpc-native', 'libnsl2-native', 'gdbm-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'openssl-native', 're2c-native', 'xorgproto', 'util-macros', 'xtrans', 'libxcb', 'm4-native', 'unzip-native', 'expat', 'libffi', 'libxshmfence', 'libxfixes', 'libxdamage', 'libxxf86vm', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'opkg-utils', 'autoconf-archive', 'python3', 'ncurses', 'libcap-ng', 'bash-completion', 'libxcrypt', 'libice', 'cairo', 'harfbuzz', 'freetype', 'fontconfig', 'fribidi', 'libxft', 'dbus', 'libpcre', 'ncurses-native', 'libcap-ng-native', 'libpcre2-native', 'libxau', 'libxdmcp', 'xcb-proto', 'libxrandr', 'openssl', 'libtirpc', 'bzip2', 'gdbm', 'libnsl2', 'readline', 'sqlite3', 'xz', 'pixman', 'icu', 'update-rc.d', 'shadow-native', 'base-passwd', 'shadow', 'base-files', 'initscripts', 'shadow-sysroot', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dnls=enabled -Dsidplay=disabled -Da52dec=enabled -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled -Ddvdread=disabled -Dmpeg2dec=enabled -Dorc=enabled -Dx264=disabled...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/gst-plugins-ugly-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-plugins-ugly
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| WARNING: Project targeting '>= 0.48' but tried to use feature introduced in '0.54.0': native arg in add_languages.
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES
| Has header "dlfcn.h" : YES
| Has header "inttypes.h" : YES
| Has header "malloc.h" : YES
| Has header "memory.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Checking for function "dcgettext" : YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-ugly-1.18.0/meson.build:119:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 151
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 206
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/gst-plugins-ugly-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-plugins-ugly
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| WARNING: Project targeting '>= 0.48' but tried to use feature introduced in '0.54.0': native arg in add_languages.
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES
| Has header "dlfcn.h" : YES
| Has header "inttypes.h" : YES
| Has header "malloc.h" : YES
| Has header "memory.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Checking for function "dcgettext" : YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-ugly-1.18.0/meson.build:119:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 151
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-ugly/1.18.0-r0/temp/run.do_configure.3922124, line 206
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 2
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2529 tasks of which 2521 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1899220550642760307==--
