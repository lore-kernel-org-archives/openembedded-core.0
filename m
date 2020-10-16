Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8F86A38C178F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.18.0 FAILED
Message-ID: <MADEUP.163E71D7381903EB.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143491
Content-Type: multipart/mixed; boundary="===============4431407471476172886=="

--===============4431407471476172886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.16.2-1.18.0.patch
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

--===============4431407471476172886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1471 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7b34f2471a0cc47bbe98fce2ff1d920e29397135"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 179 Found 172 Missed 7 Current 633 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_unpack)
NOTE: Running task 2120 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_write_config)
NOTE: Running task 2121 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2502 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2503 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2504 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2505 of 2513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_configure: Started
ERROR: gstreamer1.0-rtsp-server-1.18.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-rtsp-server-1.18.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/gst-rtsp-server-1.18.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Project name: gst-rtsp-server
Project version: 1.18.0
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-73
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES 
Compiler for C supports arguments -fvisibility=hidden: YES 
Compiler for C supports arguments -fno-strict-aliasing: YES 
Message: Disabling GLib cast checks
Compiler for C supports arguments -Wmissing-declarations: YES 
Compiler for C supports arguments -Wmissing-prototypes: YES 
Compiler for C supports arguments -Wredundant-decls: YES 
Compiler for C supports arguments -Wundef: YES 
Compiler for C supports arguments -Wwrite-strings: YES 
Compiler for C supports arguments -Wformat: YES 
Compiler for C supports arguments -Wformat-nonliteral: YES 
Compiler for C supports arguments -Wformat-security: YES 
Compiler for C supports arguments -Wold-style-definition: YES 
Compiler for C supports arguments -Waggregate-return: YES 
Compiler for C supports arguments -Winit-self: YES 
Compiler for C supports arguments -Wmissing-include-dirs: YES 
Compiler for C supports arguments -Waddress: YES 
Compiler for C supports arguments -Wno-multichar -Wmultichar: YES 
Compiler for C supports arguments -Wdeclaration-after-statement: YES 
Compiler for C supports arguments -Wvla: YES 
Compiler for C supports arguments -Wpointer-arith: YES 
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency glib-2.0 found: YES 2.64.5
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
Found CMake: NO
Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency gstreamer-1.0

../gst-rtsp-server-1.18.0/meson.build:138:0: ERROR: Subproject directory not found and gstreamer.wrap file not found

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912:190 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 190
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 170
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 155
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 210

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 6
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/log.do_configure.3925912
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoc
 to-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybui
 ld/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gstreamer1.0', 'pkgconfig-native', 'quilt-native', 'gobject-introspection', 'patch-native', 'prelink-native', 'pseudo-native', 'meson-native', 'ninja-native', 'gobject-introspection-native', 'qemu-native', 'gcc-runtime', 'gcc-cross-i686', 'glibc', 'xz-native', 'gstreamer1.0-plugins-base', 'python3-native', 'libcap', 'libxml2', 'glib-2.0', 'gnu-config-native', 'automake-native', 'autoconf-native', 'libtool-native', 'python3', 'libffi', 'autoconf-archive', 'opkg-utils', 'zlib', 'gettext-minimal-native', 'attr-native', 'elfutils-native', 'binutils-native', 'python3-setuptools-native', 're2c-native', 'zlib-native', 'gtk-doc-native', 'libffi-native', 'flex-native', 'glib-2.0-native', 'linux-libc-headers', 'libgcc', 'mpfr-native', 'texinfo-dummy-native', 'gmp-native', 'libmpc-native', 'binutils-cross-i686', 'libx11', 'libvorbis', 'libxrender', 'libpng', 'util-linux', 'wayland', 'pango', 'libsm', 'libtheora', 'orc', 'libdrm', 'libogg', 'libjp
 eg-turbo', 'alsa-lib', 'mesa', 'libxv', 'wayland-protocols', 'iso-codes', 'util-linux-native', 'libnsl2-native', 'sqlite3-native', 'gdbm-native', 'bzip2-native', 'libtirpc-native', 'openssl-native', 'readline-native', 'bash-completion', 'libpcre', 'dbus', 'm4-native', 'sqlite3', 'libnsl2', 'bzip2', 'libxcrypt', 'gdbm', 'readline', 'xz', 'openssl', 'libtirpc', 'unzip-native', 'libpcre-native', 'gettext-native', 'xorgproto', 'libxcb', 'util-macros', 'xtrans', 'libcap-ng', 'ncurses', 'expat', 'freetype', 'fribidi', 'cairo', 'harfbuzz', 'fontconfig', 'libxft', 'libice', 'libpthread-stubs', 'libpciaccess', 'libxdamage', 'libxfixes', 'libxxf86vm', 'xrandr', 'libxshmfence', 'libxext', 'libcap-ng-native', 'ncurses-native', 'libpcre2-native', 'shadow-native', 'update-rc.d', 'shadow-sysroot', 'base-passwd', 'initscripts', 'base-files', 'shadow', 'xcb-proto', 'libxdmcp', 'libxau', 'pixman', 'icu', 'libxrandr', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dtests=disabled ...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/gst-rtsp-server-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-rtsp-server
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency glib-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-rtsp-server-1.18.0/meson.build:138:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912:190 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 190
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 170
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 210
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/gst-rtsp-server-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: gst-rtsp-server
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency glib-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-rtsp-server-1.18.0/meson.build:138:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912:190 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 190
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 170
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.18.0-r0/temp/run.do_configure.3925912, line 210
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 6
NOTE: recipe gstreamer1.0-rtsp-server-1.18.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2505 tasks of which 2497 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4431407471476172886==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.16.2-1.18.0.patch"

From a75ebe2732f5e7bd557d106bf7a3be3fe9026db4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:31:23 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.16.2 -> 1.18.0

---
 ...even-when-cross-compiling-if-introsp.patch | 36 -------------------
 ....bb => gstreamer1.0-rtsp-server_1.18.0.bb} |  7 ++--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.18.0.bb} (74%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 6962a50d6e..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:42:12 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e1e3b1d..3f45f0e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -173,7 +173,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
similarity index 74%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
index 02c3c83840..c35d86ee4f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
@@ -8,12 +8,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-           "
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[sha256sum] = "2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.18.4


--===============4431407471476172886==--
