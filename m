Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB98EEE263
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29476.1694804395110897314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZDSKt+Bl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qCNm+6N5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36c211-c972d194-67d7-4786-8690-e4d12e1a623b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+IWTOLX1SU/6S6AjBR27OhFKikKULudqNMejykATM2g=;
	b=ZDSKt+BlFlRuinAkOtiAlNvpF0hLPZcFk0RUTatc+Sndx+zzEvHbhMD07KHB7XaL
	RrV118zTKmEASYbMc5+XeCwUIZkY95ZMNxonymeztEXGQvXsJI5AzReN6MmlThPxKhT
	+ULGZNipwpJraHfa0hm0Txkm76JY06QFIEx45xE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+IWTOLX1SU/6S6AjBR27OhFKikKULudqNMejykATM2g=;
	b=qCNm+6N5ojuWRN41LKk8oWqNtHsFFgSUQdI/1/Rh4oM49bVoelSHB/plKAZLmKrN
	G5n0Z+K88Rem5fZqG6tM6yD8kkJ1ei4hNNTj2DimSppYk54bSGdXbpaExfK6iVno43x
	JKohaGR7j8sp4PML/H4q/lGgJ5Nn3gON4XuUkQJI=
Content-Type: multipart/mixed; boundary="===============8927964034708104831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libportal: upgrading to 0.7.1 FAILED
Message-ID: <0101018a9a36c211-c972d194-67d7-4786-8690-e4d12e1a623b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187735

--===============8927964034708104831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libportal* to *0.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.6-0.7.1.patch
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
From a79af32fca306bc2b3892abecc42b1476d0a5d4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 14:29:24 +0000
Subject: [PATCH] libportal: upgrade 0.6 -> 0.7.1

---
 .../libportal/{libportal_0.6.bb => libportal_0.7.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.6.bb => libportal_0.7.1.bb} (94%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
similarity index 94%
rename from meta/recipes-gnome/libportal/libportal_0.6.bb
rename to meta/recipes-gnome/libportal/libportal_0.7.1.bb
index bf38fc85fd..83216d5627 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
+SRCREV = "e9ed3a50cdde321eaf42361212480a66eb94a57a"
 S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
-- 
2.39.2


--===============8927964034708104831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-6d516f360df5d51e7d3bd0071170d02a9b19bcd4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6d516f360df5d51e7d3bd0071170d02a9b19bcd4"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 398 Local 387 Mirrors 0 Missed 11 Current 819 (97% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3024 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa)
NOTE: Running task 3173 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa: Started
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3278 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 3279 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: Running task 3280 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 3281 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: Running task 3282 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: Running task 3283 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3284 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_lic)
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_lic: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3285 of 3295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysro
 ot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo
 _git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glib-2.0', 'glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'vala', 'gobject-introspection', 'gtk+3', 'gtk4', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'gobject-introspection-native', 'libtool-native', 'binutils-cross-i686', 'libmpc-native', 'gmp-native', 'zstd-native', 'xz-native', 'gnu-config-native', 'flex-native', 'linux-libc-headers', 'mpfr-native', 'zlib-native', 'texinfo-dummy-native', 'util-linux-native', 'gettext-native', 'gettext-minimal-native', 'libpcre2-native', 'libffi-native', 'attr-native', 'libjpeg-turbo', 'at-spi2-core', 'wayland', 'libxdamage', 'wayland-protocols', 'libxrender', 'libxfixes', 'mesa', 'gdk-pixbuf', 'libxi', 'libxrandr', 'cairo', 'libxcomposite', 'pango', 'libxext', 'libxkbcommon', 'opkg-utils', 'libpng', 'fontconfig', 'libx11', 'libepoxy', 'libxcursor', 'gi-docgen', 'graphene', 'tiff',
  'libxinerama', 'vulkan-loader', 'vulkan-headers', 'librsvg', 'harfbuzz', 'gstreamer1.0-plugins-bad', 'fribidi', 'bzip2-native', 'libedit-native', 'util-linux-libuuid-native', 'openssl-native', 'ncurses-native', 'expat-native', 'gdbm-native', 'sqlite3-native', 'libtirpc-native', 'libnsl2-native', 're2c-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-build-native', 'python3-installer-native', 'libgcc', 'util-linux', 'libffi', 'zlib', 'libpcre2', 'bash-completion', 'python3', 'm4-native', 'libcap-ng-native', 'libxml2', 'dbus', 'libxtst', 'expat', 'xorgproto', 'util-macros', 'libxxf86vm', 'libdrm', 'xrandr', 'libxshmfence', 'shared-mime-info', 'libxcb', 'pixman', 'libsm', 'libxft', 'freetype', 'xkeyboard-config', 'xtrans', 'xz', 'libstd-rs', 'icu', 'orc', 'curl', 'gstreamer1.0-plugins-base', 'sbc', 'libwebp', 'gstreamer1.0', 'libgudev', 'openssl', 'bzip2', 'libsndfile1', 'libusb1', 'bluez5', 'perl-native', 'cmake-native', 'python3-flit-core-native', 'python3-pack
 aging-native', 'python3-pyproject-hooks-native', 'ncurses', 'libxcrypt', 'libcap-ng', 'libpam', 'util-linux-libuuid', 'libtirpc', 'sqlite3', 'libedit', 'libnsl2', 'gdbm', 'shadow-native', 'shadow-sysroot', 'shadow', 'base-files', 'base-passwd', 'systemd', 'initscripts', 'update-rc.d', 'libpthread-stubs', 'libpciaccess', 'libxdmcp', 'xcb-proto', 'libxau', 'libice', 'libidn2', 'libvorbis', 'iso-codes', 'libglu', 'libtheora', 'libogg', 'alsa-lib', 'libxv', 'flac', 'libical', 'readline', 'make-native', 'unzip-native', 'cracklib', 'attr', 'kmod', 'acl', 'libseccomp', 'libcap', 'zstd', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true -Ddocs=false -Dbackends=gtk3,gtk4 ...
| The Meson build system
| Version: 1.1.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/build
| Build type: cross build
| 
| ../git/meson.build:1:0: ERROR: Unknown options: "backends"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582, line 180
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582, line 169
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582, line 193
NOTE: recipe libportal-0.7.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3285 tasks of which 3275 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libportal-0.7.1-r0 do_configure: meson failed
ERROR: libportal-0.7.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/run.do_configure.1515582', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libportal/0.7.1/temp/log.do_configure.1515582
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure) failed with exit code '1'

--===============8927964034708104831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.6-0.7.1.patch"

RnJvbSBhNzlhZjMyZmNhMzA2YmMyYjM4OTJhYmVjYzQyYjE0NzZkMGE1ZDRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTQ6Mjk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwb3J0YWw6IHVwZ3JhZGUgMC42IC0+IDAuNy4xCgotLS0KIC4uLi9saWJwb3J0YWwve2xpYnBv
cnRhbF8wLjYuYmIgPT4gbGlicG9ydGFsXzAuNy4xLmJifSAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1nbm9tZS9saWJwb3J0YWwve2xpYnBvcnRhbF8wLjYuYmIgPT4gbGlicG9ydGFsXzAuNy4x
LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGli
cG9ydGFsXzAuNi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAu
Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9t
ZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21l
L2xpYnBvcnRhbC9saWJwb3J0YWxfMC43LjEuYmIKaW5kZXggYmYzOGZjODVmZC4uODMyMTZkNTYy
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9saWJwb3J0YWxfMC42
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuNy4xLmJi
CkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIkxHUEwtMy4wLW9ubHkiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zMDAwMjA4ZDUzOWVjMDYxYjg5OWJjZTFkOWNlOTQw
NCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZsYXRwYWsvJHtCUE59LmdpdDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICIxM2RmMGI4ODdhN2ViN2IwZjliMTQw
Njk1NjFhNDFmNjJlODEzMTU1IgorU1JDUkVWID0gImU5ZWQzYTUwY2RkZTMyMWVhZjQyMzYxMjEy
NDgwYTY2ZWI5NGE1N2EiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0IG1lc29uIGdp
LWRvY2dlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYSBmZWF0dXJlc19jaGVjayBwa2djb25m
aWcKLS0gCjIuMzkuMgoK

--===============8927964034708104831==--

