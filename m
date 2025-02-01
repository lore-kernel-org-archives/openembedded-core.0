Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8679C282D1
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.42728.1738416058114686217
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jEYSqQNt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FLzYUJUP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1xQDr6Y4lktt1v3lP3OXot+KRKz20hSmfdpHdlHEMxQ=;
	b=jEYSqQNtk4mZakiaDTIf2ZtLAmQnYOryA+WZ/LoDuKLan55jxEUmnJ5O51dGJP/M
	dFCuA1E2hcH6Qm9A0rCZSBnYfsN1+IlteQPXhUm8J8HO79OQI1v3PGLaQ3Zbsrh24ii
	I47dfV1g0n4rVeoJ60S4TYJiOVqRj096KZGsFpPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1xQDr6Y4lktt1v3lP3OXot+KRKz20hSmfdpHdlHEMxQ=;
	b=FLzYUJUPk2Odqc8cZswT43B4wyxg0+UIXp26wYGP/IKzIdS/vWsKY12c/isOmk6f
	Jol/UfcSAfMSr9Rlr30iw8fJgEZAh4VbyLm8PfIzUHk8bZesg8++KXCiVVZVZPByTFa
	slaG8CQ5/HBXvh3LLXAwitEOvmXoPAEYGli+PjDM=
Content-Type: multipart/mixed; boundary="===============0021962259551849927=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libadwaita: upgrading to 1.6.4 FAILED
Message-ID: <01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210570

--===============0021962259551849927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.6.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.6.2-1.6.4.patch
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

-- >8 --
From d5761d4232d41283afda5bbf7a9d8d0d28440091 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 11:10:06 +0000
Subject: [PATCH] libadwaita: upgrade 1.6.2 -> 1.6.4

---
 .../libadwaita/{libadwaita_1.6.2.bb => libadwaita_1.6.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.6.2.bb => libadwaita_1.6.4.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
index 8cb32814cb..6921a12a0a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "7542f8354e6808dd4e9a31551bbdfc0170735e4af4d1b3e69186500ccb9c01eb"
+SRC_URI[archive.sha256sum] = "1011a5a93dc3b87e82da19910d7fab01a3b9d7fcb0b09751babb476eedb3d9a3"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.44.1


--===============0021962259551849927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:962f4b3bcf716d1949f15a754726588b9ff684f5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 537 Local 525 Mirrors 0 Missed 12 Current 754 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 867 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1117 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_recipe_qa)
NOTE: Running task 1130 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_write_config)
NOTE: recipe libadwaita-1.6.4-r0: task do_recipe_qa: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1156 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_fetch)
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.6.4-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1187 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1263 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2201 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1270 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.6.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1277 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 2304 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1284 of 1291 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libadwaita-1.6.4-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2353 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_populate_lic)
NOTE: recipe libadwaita-1.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_populate_lic: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3406 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3521 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3522 of 3534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_configure)
NOTE: recipe libadwaita-1.6.4-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_popu
 late_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', 'virtual:native:/srv/poky
 build/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'gtk4', 'libgudev', 'librsvg', 'libxmlb', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'li
 bxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'appstream', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'libyaml', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native'
 , 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=enabled -Dvapi=true -Dexamples=false...
| The Meson build system
| Version: 1.7.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/libadwaita-1.6.4
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/build
| Build type: cross build
| Project name: libadwaita
| Project version: 1.6.4
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/recipe-sysroot ld.bfd 2.43.1.20241111
| C compiler for the build machine: gcc (gcc 13.3.0 "gcc (GCC) 13.3.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240716
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wdate-time: YES
| Compiler for C supports arguments -Werror=format-security -Werror=format=2: YES
| Compiler for C supports arguments -Wendif-labels: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=overflow: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=shift-count-overflow: YES
| Compiler for C supports arguments -Werror=shift-overflow=2: YES
| Compiler for C supports arguments -Werror=implicit-fallthrough=3: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmaybe-uninitialized: YES
| Compiler for C supports arguments -Wmissing-field-initializers: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-sign-compare: YES
| Compiler for C supports arguments -Wno-strict-aliasing: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wswitch-default: YES
| Compiler for C supports arguments -Wswitch-enum: YES
| Compiler for C supports arguments -Wtype-limits: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused-function: YES
| Compiler for C supports arguments -Wfloat-equal: YES
| Program sassc found: NO
| 
| ../libadwaita-1.6.4/src/stylesheet/meson.build:7:2: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636, line 155
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636, line 190
NOTE: recipe libadwaita-1.6.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3522 tasks of which 3512 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201110948.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201110948.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/log.do_configure.3431636
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libadwaita-1.6.4-r0 do_configure: meson failed
ERROR: libadwaita-1.6.4-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/run.do_configure.3431636' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libadwaita/1.6.4/temp/log.do_configure.3431636
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_configure) failed with exit code '1'

--===============0021962259551849927==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.6.2-1.6.4.patch"

RnJvbSBkNTc2MWQ0MjMyZDQxMjgzYWZkYTViYmY3YTlkOGQwZDI4NDQwMDkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMToxMDowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFkd2FpdGE6IHVwZ3JhZGUgMS42LjIgLT4gMS42LjQKCi0tLQogLi4uL2xpYmFkd2FpdGEve2xp
YmFkd2FpdGFfMS42LjIuYmIgPT4gbGliYWR3YWl0YV8xLjYuNC5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS42LjIuYmIgPT4gbGliYWR3YWl0
YV8xLjYuNC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3
YWl0YS9saWJhZHdhaXRhXzEuNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEv
bGliYWR3YWl0YV8xLjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuNi4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuNi40LmJiCmluZGV4IDhj
YjMyODE0Y2IuLjY5MjFhMTJhMGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS42LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjYuNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBERVBFTkRTID0gIiBc
CiAKIGluaGVyaXQgZ25vbWViYXNlIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gdmFs
YSBmZWF0dXJlc19jaGVjawogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3NTQyZjgz
NTRlNjgwOGRkNGU5YTMxNTUxYmJkZmMwMTcwNzM1ZTRhZjRkMWIzZTY5MTg2NTAwY2NiOWMwMWVi
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMTAxMWE1YTkzZGMzYjg3ZTgyZGExOTkx
MGQ3ZmFiMDFhM2I5ZDdmY2IwYjA5NzUxYmFiYjQ3NmVlZGIzZDlhMyIKIAogQU5ZX09GX0RJU1RS
T19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAib3BlbmdsIgotLSAKMi40NC4xCgo=

--===============0021962259551849927==--

