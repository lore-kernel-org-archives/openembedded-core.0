Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8383BC38161
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.10398.1648819421688145430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=anQodCNC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017fe54bbe64-fbd79e7e-8852-483c-b280-01063f6899b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j+LR/wQGIvH6JEgqdZVzN64F0yTkOjuBz/gRQwCaLCM=;
	b=anQodCNCvYRwBLRzXRK0O5DpLHESXOzBbGHVwpV0DzKZM4VkvsGOVML8N1ZU6yVi
	QKOtCBfh5lNHSPVpkF0mRdxgL8rWRhotWW+9T9dVP8p+bN7FIniqz4YZJN7bXwUikAp
	wZkzkn5Jew+5NkauvAvTzoXSL0hQecfaWT0Qvibc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j+LR/wQGIvH6JEgqdZVzN64F0yTkOjuBz/gRQwCaLCM=;
	b=E1c4UWO0ZSAjS2rIpp33/Z8dGRIU0Tsvvu61zPCer/5vJNShUQwS3TEa08ua1jVh
	GgrqrcgS00pg2irY2Q93/39bJydVdBW4PHB2kqhjl1eJRo7BD9e+YiTb3OWfnyLCn/4
	lRKkSBTEYixcjB4njGjeFQJ+rFqPud6ZGBCIB/1M=
Content-Type: multipart/mixed; boundary="===============1848298876352489401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 42.0 FAILED
Message-ID: 
 <0101017fe54bbe64-fbd79e7e-8852-483c-b280-01063f6899b3-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163920

--===============1848298876352489401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *42.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-41.3-42.0.patch
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
--===============1848298876352489401==
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
meta-yocto-bsp       = "tmp-auh-upgrades:48ef9130802a82c3d641dce50142d7f8e04924f3"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 163 Mirrors 0 Missed 7 Current 695 (95% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2637 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_fetch)
NOTE: Running task 2938 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_write_config)
NOTE: recipe epiphany-42.0-r0: task do_fetch: Started
NOTE: recipe epiphany-42.0-r0: task do_fetch: Succeeded
NOTE: Running task 3051 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_unpack)
NOTE: Running task 3052 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.0-r0: task do_write_config: Started
NOTE: recipe epiphany-42.0-r0: task do_unpack: Started
NOTE: recipe epiphany-42.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.0-r0: task do_unpack: Succeeded
NOTE: Running task 3053 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_patch)
NOTE: recipe epiphany-42.0-r0: task do_patch: Started
NOTE: recipe epiphany-42.0-r0: task do_patch: Succeeded
NOTE: Running task 3054 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3055 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_populate_lic)
NOTE: recipe epiphany-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-42.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3056 of 3064 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_configure)
NOTE: recipe epiphany-42.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/
 recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.61.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nett
 le_3.7.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/bu
 ild/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libarchive', 'gcc-runtime', 'gcc-cross-i686', 'gsettings-desktop-schemas', 'python3-native', 'libsoup-2.4', 'json-glib', 'glib-2.0-native', 'webkitgtk', 'xz-native', 'glibc', 'quilt-native', 'qemu-native', 'libdazzle', 'meson-native', 'nettle', 'ninja-native', 'pseudo-native', 'gettext-native', 'pkgconfig-native', 'desktop-file-utils', 'libhandy', 'patch-native', 'gcr', 'zlib', 'opkg-utils', 'lzo', 'attr', 'acl', 'xz', 'bzip2', 'zstd', 'libgcc', 'linux-libc-headers', 'flex-native', 'mpfr-native', 'binutils-cross-i686', 'gmp-native', 'libtool-native', 'texinfo-dummy-native', 'gnu-config-native', 'libmpc-native', 'zlib-native', 'glib-2.0', 'gobject-introspection', 'libffi-native', 'bzip2-native', 'readline-native', 'sqlite3-native', 'util-linux-libuuid-native', 'libtirpc-native', 'libnsl2-native', 'gdbm-native', 'ncurses-native', 'openssl-native', 'libxml2', 'sqlite3', 'libpsl', 'gettext-minimal-native', 'util-linux-native', 'libpcre-nat
 ive', 'libxt', 'harfbuzz', 'libtasn1', 'libxdamage', 'gstreamer1.0', 'libxrender', 'wayland', 'libwebp', 'gtk+3', 'systemd', 'enchant2', 'gstreamer1.0-plugins-base', 'cairo', 'libxslt', 'libx11', 'libnotify', 'libjpeg-turbo', 'libsecret', 'libxcomposite', 'mesa', 'libwpe', 'wpebackend-fdo', 'atk', 'vala', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'gmp', 're2c-native', 'attr-native', 'p11-kit', 'gdk-pixbuf', 'hicolor-icon-theme', 'shared-mime-info', 'libgcrypt', 'm4-native', 'bash-completion', 'util-linux', 'libpcre', 'libffi', 'autoconf-archive', 'python3', 'perl-native', 'icu', 'libpcre2-native', 'libcap-ng-native', 'libsm', 'xorgproto', 'libxcb', 'util-macros', 'libxdmcp', 'freetype', 'libxfixes', 'expat', 'fontconfig', 'libxi', 'at-spi2-atk', 'libxext', 'libpng', 'libepoxy', 'wayland-protocols', 'libxrandr', 'pango', 'libxkbcommon', 'libxcursor', 'base-passwd', 'update-rc.d', 'libpam', 'shadow-native', 'shadow', 'initscripts', 'base-files', 
 'libseccomp', 'libcap', 'kmod', 'shadow-sysroot', 'aspell', 'libxv', 'libdrm', 'libtheora', 'libvorbis', 'orc', 'alsa-lib', 'libogg', 'iso-codes', 'pixman', 'xtrans', 'dbus', 'xrandr', 'libxxf86vm', 'libxshmfence', 'python3-flit-core-native', 'unzip-native', 'libgpg-error', 'ncurses', 'libcap-ng', 'util-linux-libuuid', 'libxcrypt', 'openssl', 'readline', 'libnsl2', 'libtirpc', 'gdbm', 'libice', 'xcb-proto', 'libxau', 'libpthread-stubs', 'at-spi2-core', 'libxft', 'fribidi', 'xkeyboard-config', 'flex', 'cracklib', 'libpciaccess', 'libxtst']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false -Dlibportal=disabled -Dsoup2=enabled...
| The Meson build system
| Version: 0.61.3
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/epiphany-42.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 42.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot (gcc 11.2.0 "i686-poky-linux-gcc (GCC) 11.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot ld.bfd 2.38.20220313
| C compiler for the build machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-4)")
| C linker for the build machine: gcc ld.bfd 2.30-108
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| WARNING: You should add the boolean check kwarg to the run_command call.
|          It currently defaults to false,
|          but it will default to true in future releases of meson.
|          See also: https://github.com/mesonbuild/meson/issues/9300
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.9.0
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency gcr-3 found: YES 3.40.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.6
| Run-time dependency gio-2.0 found: YES 2.72.0
| Run-time dependency gio-unix-2.0 found: YES 2.72.0
| Run-time dependency glib-2.0 found: YES 2.72.0
| Run-time dependency gsettings-desktop-schemas found: YES 42.0
| Run-time dependency gtk+-3.0 found: YES 3.24.33
| Run-time dependency gtk+-unix-print-3.0 found: YES 3.24.33
| Run-time dependency hogweed found: YES 3.7.3
| Dependency iso-codes found: YES 4.9.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.6.6
| Run-time dependency libarchive found: YES 3.6.0
| Run-time dependency libdazzle-1.0 found: YES 3.44.0
| Run-time dependency libhandy-1 found: YES 1.5.0
| Run-time dependency libsecret-1 found: YES 0.20.5
| Run-time dependency libxml-2.0 found: YES 2.9.13
| Run-time dependency nettle found: YES 3.7.3
| Dependency libportal-gtk3 skipped: feature libportal disabled
| Run-time dependency sqlite3 found: YES 3.38.2
| Run-time dependency libsoup-2.4 found: YES 2.74.2
| Run-time dependency webkit2gtk-4.0 found: YES 2.34.6
| Run-time dependency webkit2gtk-web-extension-4.0 found: YES 2.34.6
| Configuring config.h.in using configuration
| Found git repository at /home/pokybuild/yocto-worker/auh/build
| Library gmp found: YES
| Library m found: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Wno-cast-function-type: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Configuring org.gnome.Epiphany.desktop.in using configuration
| Configuring org.gnome.Epiphany.appdata.xml.in using configuration
| Program appstream-util found: NO
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-compile-schemas found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-schemas)
| Configuring org.gnome.Epiphany.SearchProvider.service using configuration
| Configuring org.gnome.Epiphany.SearchProvider.ini using configuration
| Configuring default-bookmarks.rdf using configuration
| Program desktop-file-validate found: NO
| Program appstream-util found: NO
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-mkenums found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program gdbus-codegen found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/gdbus-codegen)
| Program glib-compile-resources found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/recipe-sysroot-native/usr/bin/glib-compile-resources)
| 
| ../epiphany-42.0/tests/meson.build:1:0: ERROR: Program or command 'printenv' not found or not executable
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806:188 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806, line 188
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806, line 177
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806, line 201
NOTE: recipe epiphany-42.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3056 tasks of which 3048 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: epiphany-42.0-r0 do_configure: meson failed
ERROR: epiphany-42.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/run.do_configure.3309806', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/42.0-r0/temp/log.do_configure.3309806
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.0.bb:do_configure) failed with exit code '1'

--===============1848298876352489401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-41.3-42.0.patch"

From 0ccb4cde1cfe59b7f7de5d90e1e34543a90ab568 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 10:37:09 +0000
Subject: [PATCH] epiphany: upgrade 41.3 -> 42.0

---
 .../{epiphany_41.3.bb => epiphany_42.0.bb}    |  3 +-
 ...5f7bab38301d8a4a444173acdae8d9692146.patch | 35 -------------------
 2 files changed, 1 insertion(+), 37 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_41.3.bb => epiphany_42.0.bb} (90%)
 delete mode 100644 meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_41.3.bb b/meta/recipes-gnome/epiphany/epiphany_42.0.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_41.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.0.bb
index 6dca6a7305..6cb486c47e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.0.bb
@@ -24,11 +24,10 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
-           file://bfbb5f7bab38301d8a4a444173acdae8d9692146.patch \
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "ba01268ee54f318dfdac2e01eba38a3fc96940c1cbf640ed2613ae29f8bcb9ad"
+SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
diff --git a/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch b/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
deleted file mode 100644
index f20975c3bd..0000000000
--- a/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bfbb5f7bab38301d8a4a444173acdae8d9692146 Mon Sep 17 00:00:00 2001
-From: rvalue <i@rvalue.moe>
-Date: Wed, 24 Nov 2021 04:52:42 +0000
-Subject: [PATCH] Remove incorrect args for i18n.merge_file
-
-Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1031>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- data/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index 46df3fd80..eac6b8224 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -16,7 +16,6 @@ install_data(
- desktop_conf = configuration_data()
- desktop_conf.set('icon', application_id)
- desktop = i18n.merge_file(
--  'desktop',
-   input: configure_file(
-     input: files('org.gnome.Epiphany.desktop.in.in'),
-     output: 'org.gnome.Epiphany.desktop.in',
-@@ -32,7 +31,6 @@ desktop = i18n.merge_file(
- appdata_conf = configuration_data()
- appdata_conf.set('appid', application_id)
- appdata = i18n.merge_file(
--  'appdata',
-   input: configure_file(
-     input: files('org.gnome.Epiphany.appdata.xml.in.in'),
-     output: 'org.gnome.Epiphany.appdata.xml.in',
--- 
-GitLab
-
-- 
2.27.0


--===============1848298876352489401==--

