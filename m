Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.39171.1605551303697347953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 78E6F38C13C3
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.48.0 FAILED
Message-ID: <MADEUP.164810679F0D8859.27635@lists.openembedded.org>
X-Groupsio-MsgNum: 144652
Content-Type: multipart/mixed; boundary="===============6521237273786234698=="

--===============6521237273786234698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.48.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.46.2-1.48.0.patch
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

--===============6521237273786234698==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.46.2-1.48.0.patch"

From 6b2fcbc0d76a4e0a646daafb77381652a19f0f83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 15:53:53 +0000
Subject: [PATCH] pango: upgrade 1.46.2 -> 1.48.0

---
 .../recipes-graphics/pango/{pango_1.46.2.bb => pango_1.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.46.2.bb => pango_1.48.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.46.2.bb b/meta/recipes-graphics/pango/pango_1.48.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.46.2.bb
rename to meta/recipes-graphics/pango/pango_1.48.0.bb
index c41d1e8a9b..1f5887896c 100644
--- a/meta/recipes-graphics/pango/pango_1.46.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.0.bb
@@ -16,7 +16,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "d89fab5f26767261b493279b65cfb9eb0955cd44c07c5628d36094609fc51841"
+SRC_URI[archive.sha256sum] = "391f26f3341c2d7053e0fb26a956bd42360dadd825efe7088b1e9340a65e74e6"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.20.1


--===============6521237273786234698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1412 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05fb3187e8cd2e957decf71bb472fa4163f4eab9"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 184 Found 176 Missed 8 Current 565 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1430 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: Running task 1629 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1783 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: Running task 1784 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 2336 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2338 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_lic)
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_lic: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2339 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_populate_lic: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
ERROR: pango-1.48.0-r0 do_configure: meson failed
ERROR: pango-1.48.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/temp/run.do_configure.40177' failed with exit code 1:
gtkdocize: neither configure.ac nor configure.in exist
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/pango-1.48.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/share/pkgconfig'

../pango-1.48.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the GObject introspection data for Pango" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build/meson-logs/meson-log.txt
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/temp/log.do_configure.40177
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sy
 sroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype
 _2.10.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/m
 eta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['harfbuzz', 'gobject-introspection', 'libx11', 'fribidi', 'cairo', 'glibc', 'gcc-runtime', 'gcc-cross-i686', 'quilt-native', 'meson-native', 'ninja-native', 'pseudo-native', 'qemu-native', 'fontconfig', 'glib-2.0-native', 'freetype', 'patch-native', 'gtk-doc-native', 'xz-native', 'glib-2.0', 'prelink-native', 'python3-native', 'pkgconfig-native', 'libxft', 'gobject-introspection-native', 'icu', 'opkg-utils', 'python3', 'libffi', 'zlib', 'autoconf-archive', 'xtrans', 'xorgproto', 'util-macros', 'libxcb', 'libxext', 'pixman', 'libpng', 'libxrender', 'mesa', 'libsm', 'linux-libc-headers', 'binutils-cross-i686', 'autoconf-native', 'zlib-native', 'libtool-native', 'mpfr-native', 'gmp-native', 'automake-native', 'flex-native', 'libmpc-native', 'texinfo-dummy-native', 'gnu-config-native', 'python3-setuptools-native', 're2c-native', 'util-linux', 'expat', 'libpcre-native', 'libffi-native', 'gettext-native', 'gettext-minimal-native', 'util-linux
 -native', 'attr-native', 'libpcre', 'dbus', 'bash-completion', 'elfutils-native', 'binutils-native', 'libtirpc-native', 'sqlite3-native', 'libnsl2-native', 'gdbm-native', 'readline-native', 'bzip2-native', 'openssl-native', 'libgcc', 'sqlite3', 'libnsl2', 'libtirpc', 'openssl', 'gdbm', 'bzip2', 'xz', 'readline', 'libxcrypt', 'xcb-proto', 'libpthread-stubs', 'libxdmcp', 'libxau', 'libxfixes', 'libxxf86vm', 'xrandr', 'wayland-protocols', 'libxdamage', 'libxshmfence', 'libdrm', 'wayland', 'libice', 'm4-native', 'unzip-native', 'ncurses', 'libcap-ng', 'libcap-ng-native', 'ncurses-native', 'libpcre2-native', 'shadow', 'initscripts', 'base-files', 'update-rc.d', 'shadow-sysroot', 'base-passwd', 'shadow-native', 'libxrandr', 'libpciaccess', 'libxml2', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dintrospection=true -Dgtk_doc=false -Dinstall-tests=true...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/pango-1.48.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../pango-1.48.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the GObject introspection data for Pango" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/temp/run.do_configure.40177' failed with exit code 1:
| gtkdocize: neither configure.ac nor configure.in exist
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/pango-1.48.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../pango-1.48.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the GObject introspection data for Pango" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/pango/1.48.0-r0/build/meson-logs/meson-log.txt
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe pango-1.48.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2339 tasks of which 2331 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============6521237273786234698==--
