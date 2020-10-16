Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12219.1602843682980813705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A0AE838C17A0
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.38.0 FAILED
Message-ID: <MADEUP.163E71D6ABEBA23A.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143442
Content-Type: multipart/mixed; boundary="===============5563482192976169412=="

--===============5563482192976169412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.38.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.36.1-3.38.0.patch
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

--===============5563482192976169412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.36.1-3.38.0.patch"

From d9dbce3ecc39c7fe8f6012b857ad892258d99b72 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:27:07 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.36.1 -> 3.38.0

---
 ...python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
index 0a34d4373f..cff5811f94 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
@@ -14,8 +14,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
-SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
+SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.18.4


--===============5563482192976169412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1419 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:de65d644c8f4be6a3d7e5dc2d7f98a02a007d446"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 179 Found 170 Missed 9 Current 534 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 599 of 713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 713 of 713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1620 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: Running task 1850 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1946 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: Running task 1947 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2225 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2226 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_populate_lic)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2227 of 2236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
ERROR: python3-pygobject-3.38.0-r0 do_configure: meson failed
ERROR: python3-pygobject-3.38.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/pygobject-3.38.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/share/pkgconfig'

../pygobject-3.38.0/meson.build:1:0: ERROR: Value "true" for combo option "build with pycairo integration" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625:185 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 185
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 174
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 159
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 214

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 6
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/log.do_configure.3413625
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib
 -2.0_2.64.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto
 -worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'xz-native', 'python3-pycairo', 'ninja-native', 'patch-native', 'gcc-cross-i686', 'gcc-runtime', 'glib-2.0', 'gobject-introspection', 'glibc', 'python3', 'meson-native', 'gobject-introspection-native', 'qemu-native', 'prelink-native', 'python3-native', 'quilt-native', 'cairo', 'pkgconfig-native', 'automake-native', 'autoconf-native', 'libtool-native', 'gettext-minimal-native', 'gnu-config-native', 're2c-native', 'attr-native', 'mpfr-native', 'linux-libc-headers', 'gmp-native', 'libmpc-native', 'texinfo-dummy-native', 'zlib-native', 'binutils-cross-i686', 'flex-native', 'libgcc', 'libpcre', 'libffi', 'bash-completion', 'dbus', 'zlib', 'util-linux', 'autoconf-archive', 'opkg-utils', 'sqlite3', 'libnsl2', 'gdbm', 'libxcrypt', 'readline', 'bzip2', 'xz', 'openssl', 'libtirpc', 'python3-setuptools-native', 'glib-2.0-native', 'libffi-native', 'gtk-doc-native', 'binutils-native', 'elfutils-native', 'readline-native', 'util-linu
 x-native', 'sqlite3-native', 'openssl-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'gdbm-native', 'libsm', 'libxext', 'libxrender', 'libpng', 'libxcb', 'libx11', 'mesa', 'pixman', 'fontconfig', 'm4-native', 'shadow-native', 'shadow-sysroot', 'expat', 'update-rc.d', 'base-files', 'initscripts', 'shadow', 'base-passwd', 'libcap-ng', 'ncurses', 'unzip-native', 'gettext-native', 'libpcre-native', 'ncurses-native', 'libpcre2-native', 'libcap-ng-native', 'libice', 'util-macros', 'xorgproto', 'xtrans', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'libxau', 'libxshmfence', 'xrandr', 'wayland-protocols', 'libxdamage', 'libdrm', 'libxfixes', 'libxxf86vm', 'wayland', 'freetype', 'attr', 'libxrandr', 'libpciaccess', 'libxml2']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true -Dpycairo=true...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/pygobject-3.38.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../pygobject-3.38.0/meson.build:1:0: ERROR: Value "true" for combo option "build with pycairo integration" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625:185 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 185
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 174
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 159
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 214
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/pygobject-3.38.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../pygobject-3.38.0/meson.build:1:0: ERROR: Value "true" for combo option "build with pycairo integration" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625:185 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 185
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 174
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 159
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygobject/3.38.0-r0/temp/run.do_configure.3413625, line 214
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 6
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2227 tasks of which 2219 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============5563482192976169412==--
