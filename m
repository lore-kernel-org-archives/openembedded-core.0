Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12523.1602843683226428071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1713038C162D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 3.38.1 FAILED
Message-ID: <MADEUP.163E71D6D742C390.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143459
Content-Type: multipart/mixed; boundary="===============7042410293385795881=="

--===============7042410293385795881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *3.38.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-3.36.4-3.38.1.patch
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

--===============7042410293385795881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c5f37c479ea9f4b7939bf994f529e77e809634fd"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 206 Found 198 Missed 8 Current 1009 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2910 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_fetch)
NOTE: recipe epiphany-3.38.1-r0: task do_fetch: Started
NOTE: recipe epiphany-3.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 3163 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_unpack)
NOTE: Running task 3293 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_write_config)
NOTE: Running task 3294 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-3.38.1-r0: task do_unpack: Started
NOTE: recipe epiphany-3.38.1-r0: task do_write_config: Started
NOTE: recipe epiphany-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-3.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 3753 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_patch)
NOTE: recipe epiphany-3.38.1-r0: task do_patch: Started
NOTE: recipe epiphany-3.38.1-r0: task do_patch: Succeeded
NOTE: Running task 3754 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3755 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_populate_lic)
NOTE: recipe epiphany-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-3.38.1-r0: task do_populate_lic: Started
NOTE: recipe epiphany-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3756 of 3764 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_configure)
NOTE: recipe epiphany-3.38.1-r0: task do_configure: Started
ERROR: epiphany-3.38.1-r0 do_configure: meson failed
ERROR: epiphany-3.38.1-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/epiphany-3.38.1
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Project name: epiphany
Project version: 3.38.1
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-73
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency iso-codes found: YES 4.5.0
Configuring config.h.in using configuration
Found git repository at /home/pokybuild/yocto-worker/auh/build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency cairo found: YES 1.16.0
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gcr-3 found: YES 3.36.0
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gdk-3.0 found: YES 3.24.22
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gdk-pixbuf-2.0 found: YES 2.40.0
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gio-2.0 found: YES 2.64.5
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gio-unix-2.0 found: YES 2.64.5
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency glib-2.0 found: YES 2.64.5
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gsettings-desktop-schemas found: YES 3.36.1
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gtk+-3.0 found: YES 3.24.22
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency gtk+-unix-print-3.0 found: YES 3.24.22
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency hogweed found: YES 3.6
Dependency iso-codes found: YES 4.5.0 (cached)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Run-time dependency json-glib-1.0 found: YES 1.4.4
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
Dependency libdazzle-1.0 found: NO found 3.36.0 but need: '>= 3.37.1'
Found CMake: NO
Run-time dependency libdazzle-1.0 found: NO 

../epiphany-3.38.1/meson.build:94:0: ERROR: Invalid version of dependency, need 'libdazzle-1.0' ['>= 3.37.1'] found '3.36.0'.

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965:186 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 186
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 166
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 151
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 206

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/log.do_configure.1451965
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.
 7.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.36.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21
 .bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libdazzle', 'avahi', 'xz-native', 'gcc-cross-i686', 'quilt-native', 'gcc-runtime', 'patch-native', 'gtk+3', 'libhandy', 'python3-native', 'iso-codes', 'libsoup-2.4', 'desktop-file-utils', 'libxml2-native', 'ninja-native', 'libnotify', 'gcr', 'pkgconfig-native', 'glib-2.0', 'json-glib', 'glibc', 'meson-native', 'glib-2.0-native', 'gettext-native', 'webkitgtk', 'gsettings-desktop-schemas', 'pseudo-native', 'vala', 'gobject-introspection', 'dbus', 'libdaemon', 'base-files', 'shadow-sysroot', 'shadow', 'shadow-native', 'update-rc.d', 'libcap', 'base-passwd', 'initscripts', 'expat', 'autoconf-native', 'gmp-native', 'flex-native', 'texinfo-dummy-native', 'zlib-native', 'libmpc-native', 'libtool-native', 'automake-native', 'linux-libc-headers', 'mpfr-native', 'binutils-cross-i686', 'gnu-config-native', 'gettext-minimal-native', 'libgcc', 'attr-native', 'libx11', 'pango', 'libpng', 'libxcomposite', 'libepoxy', 'gdk-pixbuf', 'wayland-protocols'
 , 'fontconfig', 'mesa', 'opkg-utils', 'libxkbcommon', 'libxfixes', 'libxi', 'libjpeg-turbo', 'libxext', 'libxdamage', 'libxrender', 'cairo', 'wayland', 'at-spi2-atk', 'libxrandr', 'atk', 'libxcursor', 'libffi-native', 'openssl-native', 'bzip2-native', 'libtirpc-native', 'readline-native', 'util-linux-native', 'sqlite3-native', 'gdbm-native', 'libnsl2-native', 'libpsl', 'sqlite3', 'libxml2', 're2c-native', 'p11-kit', 'shared-mime-info', 'libgcrypt', 'hicolor-icon-theme', 'libpcre', 'util-linux', 'zlib', 'bash-completion', 'libffi', 'python3-setuptools-native', 'gtk-doc-native', 'libpcre-native', 'libtheora', 'libxt', 'libwebp', 'enchant2', 'librsvg', 'gstreamer1.0', 'harfbuzz', 'gstreamer1.0-plugins-bad', 'libtasn1', 'libvorbis', 'icu', 'eudev', 'libsecret', 'gawk', 'libxslt', 'wpebackend-fdo', 'libwpe', 'curl', 'gstreamer1.0-plugins-base', 'autoconf-archive', 'python3', 'libsm', 'attr', 'libxcrypt', 'm4-native', 'xorgproto', 'xtrans', 'util-macros', 'libxcb', 'freetype', 'fribidi', 
 'libxft', 'libxxf86vm', 'libxshmfence', 'libdrm', 'xrandr', 'xkeyboard-config', 'pixman', 'at-spi2-core', 'ncurses-native', 'libpcre2-native', 'libcap-ng-native', 'libidn2', 'libgpg-error', 'bzip2', 'ncurses', 'libcap-ng', 'unzip-native', 'libogg', 'libxdmcp', 'aspell', 'libcroco', 'bluez5', 'vulkan-loader', 'libgudev', 'libusb1', 'openssl', 'nettle', 'sbc', 'libsndfile1', 'orc', 'kmod', 'readline', 'gnutls', 'libxv', 'alsa-lib', 'libtirpc', 'xz', 'libnsl2', 'gdbm', 'libice', 'libxau', 'libpthread-stubs', 'xcb-proto', 'libpciaccess', 'libxtst', 'libunistring', 'libical', 'vulkan-headers', 'gmp', 'flac']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson ...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/epiphany-3.38.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: epiphany
| Project version: 3.38.1
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency iso-codes found: YES 4.5.0
| Configuring config.h.in using configuration
| Found git repository at /home/pokybuild/yocto-worker/auh/build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency cairo found: YES 1.16.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gcr-3 found: YES 3.36.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gdk-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.40.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gio-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gio-unix-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency glib-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gsettings-desktop-schemas found: YES 3.36.1
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gtk+-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gtk+-unix-print-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency hogweed found: YES 3.6
| Dependency iso-codes found: YES 4.5.0 (cached)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency json-glib-1.0 found: YES 1.4.4
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency libdazzle-1.0 found: NO found 3.36.0 but need: '>= 3.37.1'
| Found CMake: NO
| Run-time dependency libdazzle-1.0 found: NO
| 
| ../epiphany-3.38.1/meson.build:94:0: ERROR: Invalid version of dependency, need 'libdazzle-1.0' ['>= 3.37.1'] found '3.36.0'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 151
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 206
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/epiphany-3.38.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Project name: epiphany
| Project version: 3.38.1
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency iso-codes found: YES 4.5.0
| Configuring config.h.in using configuration
| Found git repository at /home/pokybuild/yocto-worker/auh/build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency cairo found: YES 1.16.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gcr-3 found: YES 3.36.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gdk-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.40.0
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gio-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gio-unix-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency glib-2.0 found: YES 2.64.5
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gsettings-desktop-schemas found: YES 3.36.1
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gtk+-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency gtk+-unix-print-3.0 found: YES 3.24.22
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency hogweed found: YES 3.6
| Dependency iso-codes found: YES 4.5.0 (cached)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Run-time dependency json-glib-1.0 found: YES 1.4.4
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency libdazzle-1.0 found: NO found 3.36.0 but need: '>= 3.37.1'
| Found CMake: NO
| Run-time dependency libdazzle-1.0 found: NO
| 
| ../epiphany-3.38.1/meson.build:94:0: ERROR: Invalid version of dependency, need 'libdazzle-1.0' ['>= 3.37.1'] found '3.36.0'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 151
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/3.38.1-r0/temp/run.do_configure.1451965, line 206
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 2
NOTE: recipe epiphany-3.38.1-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3756 tasks of which 3748 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============7042410293385795881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-3.36.4-3.38.1.patch"

From 35127b3e0643082d4ac98017a24fdc1b57fb7108 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 06:41:20 +0000
Subject: [PATCH] epiphany: upgrade 3.36.4 -> 3.38.1

---
 .../epiphany/{epiphany_3.36.4.bb => epiphany_3.38.1.bb}     | 2 +-
 .../0002-help-meson.build-disable-the-use-of-yelp.patch     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.36.4.bb => epiphany_3.38.1.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
index 4c3b18331a..e0ffa3da05 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.sha256sum] = "588a75b1588f5a509c33cf0be6a38a0f4fc1748eeb499a51d991ddef485242bf"
+SRC_URI[archive.sha256sum] = "59b7576acb11fbb52eaca6dbf6fce28664de5c915ca2580c47f0b08ba83d2843"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index d4f3cc1d35..118b5d1825 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 0048ae2d225d25cc58f378718ca6f9ddb1a228f9 Mon Sep 17 00:00:00 2001
+From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/help/meson.build b/help/meson.build
-index fddcf4c..f7d76c6 100644
+index 484860c..d9b2e80 100644
 --- a/help/meson.build
 +++ b/help/meson.build
 @@ -32,7 +32,7 @@ help_media = [
-   'media/web-browser.png'
+   'media/epiphany-private-3-36.png'
  ]
  
 -gnome.yelp(meson.project_name(),
-- 
2.18.4


--===============7042410293385795881==--
