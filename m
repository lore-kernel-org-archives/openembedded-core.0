Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EC7C35296
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.10467.1648819420653214980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=5b640XVs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017fe54bbf8d-9e850a78-47b4-4c6a-9f79-0f447f291960-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ER4UuYi4KE3mvlFUMBlBGvUsvBu0yZOe1xlRWO8dmBY=;
	b=5b640XVs21QjU79VseWjdfxWutxfI4c9FyM2rGg8Sj8rZRBaaZXSPVBW+t0KvLQf
	Vsq74yafnMCZs6GFYx7J0FyXxVtxyOXfmjrVSyjC5L/pznlbXZUDJwfPQWKxhf9QezE
	Ra8/TCiTXtaLNgfdsfMlbHw3aTGdeeBdHk7RWnIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ER4UuYi4KE3mvlFUMBlBGvUsvBu0yZOe1xlRWO8dmBY=;
	b=deyxEH6du5FNPtKK0XmezSfjv4ijmtoCZQ9R5+5mLzyNK3/w2+Sg2PyDRnDjU6iX
	il3lVEjKvmN+KfvVusRw9fue4dpPkzZwZGIbWATdJJegRcKtjpobIwgQvLNLVGMGF0S
	CPO+MYhLA7ft2E/W1Y/SOwXTu0yO8ayfVQAtxgUo=
Content-Type: multipart/mixed; boundary="===============1979247071310716272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.54.0 FAILED
Message-ID: 
 <0101017fe54bbf8d-9e850a78-47b4-4c6a-9f79-0f447f291960-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163914

--===============1979247071310716272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.54.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.52.7-2.54.0.patch
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
--===============1979247071310716272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.52.7-2.54.0.patch"

From 97125e3d6e93448c055a756fe981db1eed81cb92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 11:12:27 +0000
Subject: [PATCH] librsvg: upgrade 2.52.7 -> 2.54.0

---
 .../librsvg/{librsvg_2.52.7.bb => librsvg_2.54.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.7.bb => librsvg_2.54.0.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
index 78eb93c635..10c5d466dd 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
+SRC_URI[archive.sha256sum] = "baf8ebc147f146b4261bb3d0cd0fac944bf8dbb4b1f2347d23341f974dcc3085"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.27.0


--===============1979247071310716272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d1acf2157ff7f428ba1523f800690e97d48141ca"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 206 Local 199 Mirrors 0 Missed 7 Current 380 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1778 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_fetch)
NOTE: recipe librsvg-2.54.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.0-r0: task do_fetch: Succeeded
NOTE: Running task 2088 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_unpack)
NOTE: Running task 2089 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.0-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.54.0-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_patch)
NOTE: recipe librsvg-2.54.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.0-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2092 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_rust_create_wrappers)
NOTE: Running task 2093 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.0-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.54.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2094 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_configure)
NOTE: recipe librsvg-2.54.0-r0: task do_populate_lic: Succeeded
NOTE: recipe librsvg-2.54.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot'
 , 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot
 ', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/
 gobject-introspection_1.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'quilt-native', 'rust-cross-core2-32-glibc', 'gcc-cross-i686', 'xz-native', 'libxml2', 'libcroco', 'gtk-doc-native', 'patch-native', 'qemu-native', 'glib-2.0', 'cairo', 'pseudo-native', 'libstd-rs', 'cargo-native', 'libtool-native', 'python3-native', 'gcc-runtime', 'gdk-pixbuf', 'gdk-pixbuf-native', 'vala', 'automake-native', 'pango', 'gobject-introspection-native', 'vala-native', 'autoconf-native', 'gobject-introspection', 'pkgconfig-native', 'libtool-cross', 'gettext-minimal-native', 'zlib', 'python3', 'attr-native', 'libpcre', 'libffi', 'util-linux', 'bash-completion', 'pixman', 'libxrender', 'fontconfig', 'libpng', 'opkg-utils', 'libx11', 'libsm', 'libxcb', 'mesa', 'libxext', 'libssh2-native', 'zlib-native', 'curl-native', 'ca-certificates-native', 'rust-native', 'openssl-native', 'libtirpc-native', 'util-linux-libuuid-native', 'libffi-native', 'libnsl2-native', 'sqlite3-native', 'gdbm-native', 'readline-native', 'bzip2-nat
 ive', 'ncurses-native', 'linux-libc-headers', 'libgcc', 'texinfo-dummy-native', 'harfbuzz', 'fribidi', 'freetype', 'libxft', 'flex-native', 'glib-2.0-native', 'm4-native', 'gnu-config-native', 'autoconf-archive', 'rust-llvm-native', 'libmpc-native', 'gmp-native', 'mpfr-native', 'binutils-cross-i686', 'libjpeg-turbo', 'shared-mime-info', 'libjpeg-turbo-native', 'libpng-native', 'shared-mime-info-native', 'libxcrypt', 'libnsl2', 'readline', 'xz', 'openssl', 'libtirpc', 'util-linux-libuuid', 'bzip2', 'sqlite3', 'ncurses', 'gdbm', 'libcap-ng', 'libpam', 'util-macros', 'xorgproto', 'expat', 'xtrans', 'libice', 'libxau', 'libxdmcp', 'xcb-proto', 'libpthread-stubs', 'libxxf86vm', 'libxdamage', 'libxshmfence', 'xrandr', 'wayland', 'wayland-protocols', 'libdrm', 'libxfixes', 'perl-native', 'icu', 'gettext-native', 'libpcre-native', 'util-linux-native', 'cmake-native', 'libxml2-native', 'itstool-native', 'flex', 'cracklib', 'libxrandr', 'libpciaccess', 'libcap-ng-native', 'libpcre2-native', '
 zstd-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| gtkdocize: GTK_DOC_CHECK not called in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/configure.ac
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/librsvg-2.54.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:75: installing './compile'
| configure.ac:34: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: Leaving directory '.'
| NOTE: Running ../librsvg-2.54.0/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot --enable-introspection --disable-gtk-doc  --disable-static  --enable-pixbuf-loader
| configure: WARNING: unrecognized options: --disable-gtk-doc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking whether ln -s works... yes
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot... none
| checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for gawk... (cached) gawk
| checking for library containing strerror... none required
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking whether byte ordering is bigendian... (cached) no
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-file... no
| checking for file... file
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for cos in -lm... yes
| checking for dlopen... yes
| checking for i686-poky-linux-cargo... no
| checking for cargo... cargo
| checking for i686-poky-linux-rustc... no
| checking for rustc... rustc
| checking for rst2man... no
| checking for rst2man.py... no
| configure: error: rst2man is required.  Please install python3-docutils.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127:316 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127, line 316
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127, line 292
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127, line 262
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127, line 182
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127, line 320
NOTE: recipe librsvg-2.54.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2094 tasks of which 2086 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.0-r0 do_configure: configure failed
ERROR: librsvg-2.54.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/run.do_configure.249127', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/librsvg/2.54.0-r0/temp/log.do_configure.249127
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb:do_configure) failed with exit code '1'

--===============1979247071310716272==--

