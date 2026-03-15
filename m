Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8649FF013F8
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28789.1773582111530664222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I3DNOfcv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eA/FrPFL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb89e9-b36ad110-52f0-4fd8-a5d0-e181f1b840fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Btq5viL6BroZw4eu6rEZiuyAupOi+vqky9vXqkRd6oI=;
	b=I3DNOfcvTIhaUNN4QAEueOaNujoAfwVQzRPd6kNfwqU1HD0fk+sT1PRh9hJGeASt
	Ss+gQIsTka5lrT1s0rUU+ZidnRk+YDUd7JaeJnWq6wlmOhk/08IdXz074SGPHk5txET
	g+l3BACVJ2VjmM0QI3wVOm9kZVHgRQxVdEmVuWpk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Btq5viL6BroZw4eu6rEZiuyAupOi+vqky9vXqkRd6oI=;
	b=eA/FrPFLiV+r034H0odzt3AYVqAzreTmnhff0hG7q3VqNMyokQNBQ+aHFPJSbM6p
	aJMGCu1kQ3w+hbArRe2TV5k3i1dH2Bow5JmxJsY0wAH+P6FkxqGrBzho6DIaLWuixvG
	c5AGyHHleL4lrHeXLRCspsm21aehuMyL0KakUJ3o=
Content-Type: multipart/mixed; boundary="===============5252480074532333350=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-python: upgrading to 1.28.1 FAILED
Message-ID: <0101019cf1bb89e9-b36ad110-52f0-4fd8-a5d0-e181f1b840fb-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233178

--===============5252480074532333350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.28.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.26.9-1.28.1.patch
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
From 7c94048d9ac2643b5e01471ac1d62d800058b4f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 11:16:59 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.26.9 -> 1.28.1

---
 ...reamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb
index 57ddf0bbba..843f4fb820 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b59f26e842b8849"
+SRC_URI[sha256sum] = "d47cea95adb95ba10443ed7812c7c5fa0807aef43b98cd1c6d8fb9f9a86f7085"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============5252480074532333350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-b7284f98804e01714935171e5251d8da24a25f8d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:b7284f98804e01714935171e5251d8da24a25f8d"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 377 Local 364 Mirrors 0 Missed 13 Current 1063 (96% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3416 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3615 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3955 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 3956 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_unpack)
NOTE: Running task 3957 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 3958 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_patch)
NOTE: Running task 3959 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 3960 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3961 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3962 of 3974 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/
 build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysr
 oot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-pycairo', 'python3-pygobject', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11'
 , 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'libvorbis', 'sbc', 'libwebp', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-
 native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Dplugin=enabled -Dlibpython-dir=/usr/lib ...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/sources/gst-python-1.28.1
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/build
| Build type: cross build
| Project name: gst-python
| Project version: 1.28.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO
| 
| ../sources/gst-python-1.28.1/meson.build:19:10: ERROR: Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| Dependency lookup for gstreamer-1.0 with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO
| 
| ../sources/gst-python-1.28.1/meson.build:19:10: ERROR: Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397, line 184
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397, line 197
NOTE: recipe gstreamer1.0-python-1.28.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3962 tasks of which 3952 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315111643.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315111643.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/log.do_configure.1075397
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.28.1-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-python-1.28.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/run.do_configure.1075397' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.1/temp/log.do_configure.1075397
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.1.bb:do_configure) failed with exit code '1'

--===============5252480074532333350==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.26.9-1.28.1.patch"

RnJvbSA3Yzk0MDQ4ZDlhYzI2NDNiNWUwMTQ3MWFjMWQ2MmQ4MDAwNThiNGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTE6MTY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjYuOSAtPiAxLjI4LjEKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguMS5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjEuYmIKaW5kZXggNTdkZGYwYmJiYS4uODQzZjRmYjgyMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguMS5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjFhNTFkMzVmZDk3M2FmMTE4Njc5NWQz
ZDlkNjk2ZjMyMTU4NGFlYjA5YWI0ZDE3NmI1OWYyNmU4NDJiODg0OSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkNDdjZWE5NWFkYjk1YmExMDQ0M2VkNzgxMmM3YzVmYTA4MDdhZWY0M2I5OGNkMWM2
ZDhmYjlmOWE4NmY3MDg1IgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIK
IFJERVBFTkRTOiR7UE59ICs9ICJnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSBweXRob24zLXB5Z29iamVjdCIKLS0gCjIuNDcuMQoK

--===============5252480074532333350==--

