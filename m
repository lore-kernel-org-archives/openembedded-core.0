Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12526.1602843683674856204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 832CC38C1771
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.18.0 FAILED
Message-ID: <MADEUP.163E71D732EE6D17.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143489
Content-Type: multipart/mixed; boundary="===============6737486369550280416=="

--===============6737486369550280416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.16.2-1.18.0.patch
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

--===============6737486369550280416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1468 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0b6072557ca45ebd91ea16a5d5661a648606e404"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 202 Found 195 Missed 7 Current 717 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2157 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_fetch: Started
NOTE: Running task 2408 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2427 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_unpack)
NOTE: Running task 2428 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2789 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2790 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2791 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2792 of 2800 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_configure: Started
ERROR: gstreamer1.0-omx-1.18.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-omx-1.18.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/gst-omx-1.18.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Project name: gst-omx
Project version: 1.18.0
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-73
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
Found CMake: NO
Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency gstreamer-1.0

../gst-omx-1.18.0/meson.build:129:0: ERROR: Subproject directory not found and gstreamer.wrap file not found

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709:176 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 176
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 165
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 150
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 205

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/log.do_configure.3915709
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devt
 ools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'pkgconfig-native', 'gstreamer1.0-plugins-bad', 'patch-native', 'libomxil', 'glibc', 'gstreamer1.0', 'gcc-runtime', 'pseudo-native', 'meson-native', 'gstreamer1.0-plugins-base', 'xz-native', 'python3-native', 'ninja-native', 'gcc-cross-i686', 'automake-native', 'autoconf-native', 'libtool-native', 'gnu-config-native', 'cairo', 'libdrm', 'curl', 'libxml2', 'nettle', 'vulkan-loader', 'wayland', 'openssl', 'bzip2', 'wayland-protocols', 'gobject-introspection', 'libgudev', 'sbc', 'bluez5', 'orc', 'libwebp', 'pango', 'libsndfile1', 'librsvg', 'libusb1', 'attr-native', 'linux-libc-headers', 'libcap', 'glib-2.0', 'libgcc', 'python3-setuptools-native', 'libtheora', 'libsm', 'iso-codes', 'libxv', 'libx11', 'libpng', 'libxrender', 'libjpeg-turbo', 'libogg', 'mesa', 'zlib', 'alsa-lib', 'libvorbis', 'util-linux', 'gettext-minimal-native', 'util-linux-native', 'gdbm-native', 'zlib-native', 'openssl-native', 'bzip2-native', 'sqlite3-n
 ative', 'libnsl2-native', 'libtirpc-native', 'readline-native', 'libffi-native', 're2c-native', 'mpfr-native', 'binutils-cross-i686', 'gmp-native', 'flex-native', 'libmpc-native', 'texinfo-dummy-native', 'm4-native', 'libxext', 'fontconfig', 'pixman', 'libxcb', 'opkg-utils', 'libpthread-stubs', 'libpciaccess', 'libidn2', 'gnutls', 'python3', 'gmp', 'vulkan-headers', 'libxrandr', 'expat', 'libffi', 'autoconf-archive', 'eudev', 'update-rc.d', 'initscripts', 'dbus', 'libical', 'readline', 'freetype', 'harfbuzz', 'fribidi', 'libxft', 'flac', 'libcroco', 'gdk-pixbuf', 'bash-completion', 'libpcre', 'unzip-native', 'libice', 'xtrans', 'xorgproto', 'util-macros', 'libxshmfence', 'libxdamage', 'xrandr', 'libxxf86vm', 'libxfixes', 'libcap-ng', 'ncurses', 'libxcrypt', 'libpcre2-native', 'ncurses-native', 'libcap-ng-native', 'xcb-proto', 'libxau', 'libxdmcp', 'libunistring', 'libtirpc', 'sqlite3', 'xz', 'gdbm', 'libnsl2', 'kmod', 'shadow-sysroot', 'base-passwd', 'shadow-native', 'shadow', 'base
 -files', 'icu', 'shared-mime-info', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtarget=bellagio ...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/gst-omx-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-omx
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-omx-1.18.0/meson.build:129:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 205
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/gst-omx-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-omx
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-omx-1.18.0/meson.build:129:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.18.0-r0/temp/run.do_configure.3915709, line 205
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 2
NOTE: recipe gstreamer1.0-omx-1.18.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2792 tasks of which 2784 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============6737486369550280416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.16.2-1.18.0.patch"

From cd23472f7f7533edbd8449083b5097d7952b9630 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:27:05 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.16.2 -> 1.18.0

---
 .../{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..e60228850f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.18.4


--===============6737486369550280416==--
