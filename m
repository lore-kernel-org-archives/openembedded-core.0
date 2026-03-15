Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84A3F013D0
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28801.1773582115543762820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sG/vmpum;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gg8iKNqI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb8a52-70a5bdf3-aeea-4e55-9811-6eeaef206311-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0gtqyh7GMduv2s+mco39o4PWAeEFmeZ3wD1h2jzLeTg=;
	b=sG/vmpumJWy/fJABotNuPnIYbzepAiOJ6QzEdZH4KQ8c6QBrWbQair0RWdfpHDyu
	WkhxpCuDmIgFnT2WwgAgfmyhX5lZ6BBCOifvXi5/cOOkUGcobpZh0Ej6sPmqEUunmAU
	unxXzIjznD3eMkNlaU9YsUHCEGiOh94WjgryZx0U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0gtqyh7GMduv2s+mco39o4PWAeEFmeZ3wD1h2jzLeTg=;
	b=gg8iKNqIvsiY/gE9V+pLh8RY4AKGPMF+xy02zv5JGZNhptLcg0KjcoQ9Z6qXnxZh
	NbZM2FqgmpZiwkPsAb8F+Iz/cVw7cpk0Hx5FoBiwvDs32NwFMjHfnMyyzn0wgZYSCFw
	THpUHNjYCmI1Jr+H6MGAWJlLmNni+zWGsm+MXle8=
Content-Type: multipart/mixed; boundary="===============8400564917142157175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.28.1 FAILED
Message-ID: <0101019cf1bb8a52-70a5bdf3-aeea-4e55-9811-6eeaef206311-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233181

--===============8400564917142157175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.28.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.26.9-1.28.1.patch
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
From de2941972cdfbf4ee0be3323181b8493b85611ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 11:09:42 +0000
Subject: [PATCH] gst-devtools: upgrade 1.26.9 -> 1.28.1

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.9.bb => gst-devtools_1.28.1.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.9.bb => gst-devtools_1.28.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..8107cf7c7e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From 46848da6d40cf1aa2a7eefb4bb84d279acc8a022 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb
index 44c579f2a4..9f1bb4335d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e900017a6812026b567"
+SRC_URI[sha256sum] = "a4e49cd082972a132ca5f54be52a3c386db37c4cb0e487e017ba00d83a5f985d"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============8400564917142157175==
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
DISTRO_VERSION       = "5.3.99+snapshot-6522fa7f6c8ba76438a5978cd7a4a8c7ac04705d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6522fa7f6c8ba76438a5978cd7a4a8c7ac04705d"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 299 Local 287 Mirrors 0 Missed 12 Current 856 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2823 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_recipe_qa)
NOTE: Running task 2947 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_write_config)
NOTE: recipe gst-devtools-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3185 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_fetch)
NOTE: recipe gst-devtools-1.28.1-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 3186 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_unpack)
NOTE: Running task 3187 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.28.1-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 3188 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_patch)
NOTE: Running task 3189 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.28.1-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 3190 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3191 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_populate_lic)
NOTE: recipe gst-devtools-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3192 of 3204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_configure)
NOTE: recipe gst-devtools-1.28.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yo
 cto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'v
 irtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'json-glib', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'x
 orgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspect
 ion-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Ddebug_viewer=disabled -Dtests=disabled -Ddots_viewer=disabled -Dvalidate=enabled -Dnls=enabled -Dcairo=disabled...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/sources/gst-devtools-1.28.1
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/build
| Build type: cross build
| Project name: gst-devtools
| Project version: 1.28.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-devtools-1.28.1/meson.build:81:10: ERROR: Attempted to resolve subproject without subprojects directory present.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-devtools-1.28.1/meson.build:81:10: ERROR: Attempted to resolve subproject without subprojects directory present.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469, line 176
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469, line 189
NOTE: recipe gst-devtools-1.28.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3192 tasks of which 3182 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315110928.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315110928.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/log.do_configure.1029469
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-devtools-1.28.1-r0 do_configure: meson setup failed
ERROR: gst-devtools-1.28.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/run.do_configure.1029469' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-devtools/1.28.1/temp/log.do_configure.1029469
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.1.bb:do_configure) failed with exit code '1'

--===============8400564917142157175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.26.9-1.28.1.patch"

RnJvbSBkZTI5NDE5NzJjZGZiZjRlZTBiZTMzMjMxODFiODQ5M2I4NTYxMWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTE6MDk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjguMQoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI2LjkuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguMS5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI2LjkuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguMS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
ODEwN2NmN2M3ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDY4NDhkYTZkNDBjZjFhYTJh
N2VlZmI0YmI4NGQyNzlhY2M4YTAyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2Ljku
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yOC4xLmJiCmluZGV4IDQ0YzU3OWYyYTQuLjlmMWJiNDMzNWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi45LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yOC4x
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTVjN2FkYWY5ZWVl
N2E1MjE5ZDQ0YjczNmM0MDFhOTQ3ZWJiNWQwMTMwYzc4ZTkwMDAxN2E2ODEyMDI2YjU2NyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJhNGU0OWNkMDgyOTcyYTEzMmNhNWY1NGJlNTJhM2MzODZkYjM3
YzRjYjBlNDg3ZTAxN2JhMDBkODNhNWY5ODVkIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============8400564917142157175==--

