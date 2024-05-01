Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A722C27C4F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1118.1714579216824553081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F/VAXLDe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=D9AkQ18h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f34e297a6-f6ea2695-d141-40eb-89cd-bcde56b52d86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EqeHr2+JxYr9B+TwZwRJhnkTkd7oeyOvLSDRlIhhvFo=;
	b=F/VAXLDeuNNrHH+/RYAHhoxubEZswhrExuzEZPRQUeU3qFRemrQ/LoIJh+rg3+8D
	tlWB9mQiKStUaaqLx/d9BPdMkR4CoDnpgzvXZcYxLf7GjFyhUtHuy+XWndQJoZbk6W8
	sDZMUws0IsXXL0gveLxXjd5OomCWG1FAfWE14OpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EqeHr2+JxYr9B+TwZwRJhnkTkd7oeyOvLSDRlIhhvFo=;
	b=D9AkQ18haZtC++PDGVhoB4OWHemiJ04ZTBrudUNVLw9p5UvcigAUhncDzYc3P+il
	4nLVLEF08Urmc3Ot0d6EynMFEnHJiaXZUqTGx/+rS5X18GZ2gzpBhgu4VQZwfFoAZ37
	/ZP2IljYAptxsW1m9NFCNe2mp0Rp6Mq61kDC0EfI=
Content-Type: multipart/mixed; boundary="===============6406672110004361906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.24.3 FAILED
Message-ID: <0101018f34e297a6-f6ea2695-d141-40eb-89cd-bcde56b52d86-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198861

--===============6406672110004361906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.24.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.22.11-1.24.3.patch
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
From 27490b7208e24edaceb21e7cbe070dcdafe9fc54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 14:02:49 +0000
Subject: [PATCH] gstreamer1.0-plugins-good: upgrade 1.22.11 -> 1.24.3

---
 ...ine-ioctl_req_t-for-posix-linux-case.patch | 38 -------------------
 ...bb => gstreamer1.0-plugins-good_1.24.3.bb} |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.24.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
deleted file mode 100644
index 33bd4200f6..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b77d4806fd5de50d0b017a3e6a19c5bfdef7b3e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Feb 2023 12:47:31 -0800
-Subject: [PATCH] v4l2: Define ioctl_req_t for posix/linux case
-
-this is an issue seen with musl based linux distros e.g. alpine [1]
-musl is not going to change this since it breaks ABI/API interfaces
-Newer compilers are stringent ( e.g. clang16 ) which can now detect
-signature mismatches in function pointers too, existing code warned but
-did not error with older clang
-
-Fixes
-gstv4l2object.c:544:23: error: incompatible function pointer types assigning to 'gint (*)(gint, ioctl_req_t, ...)' (aka 'int (*)(int, unsigned long, ...)') from 'int (int, int, ...)' [-Wincompatible-function-pointer-types]
-    v4l2object->ioctl = ioctl;
-                      ^ ~~~~~
-
-[1] https://gitlab.alpinelinux.org/alpine/aports/-/issues/7580
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3950]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- sys/v4l2/gstv4l2object.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
-index d95b375..5223cbb 100644
---- a/sys/v4l2/gstv4l2object.h
-+++ b/sys/v4l2/gstv4l2object.h
-@@ -76,6 +76,8 @@ typedef gboolean  (*GstV4l2UpdateFpsFunction) (GstV4l2Object * v4l2object);
-  * 'unsigned long' for the 2nd parameter */
- #ifdef __ANDROID__
- typedef unsigned ioctl_req_t;
-+#elif defined(__linux__) && !defined(__GLIBC__) /* musl/linux */
-+typedef int ioctl_req_t;
- #else
- typedef gulong ioctl_req_t;
- #endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
index 9ce3f73f7c..34af618f00 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
@@ -4,10 +4,9 @@ SUMMARY = "'Good' GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-           file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
+SRC_URI[sha256sum] = "150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.44.0


--===============6406672110004361906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3d17588e1fc1b4c604606955aa6795936a9833dc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3d17588e1fc1b4c604606955aa6795936a9833dc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 474 Local 461 Mirrors 0 Missed 13 Current 766 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3022 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_recipe_qa)
NOTE: Running task 3188 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3351 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_fetch: Succeeded
NOTE: Running task 3352 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_unpack)
NOTE: Running task 3353 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 3354 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_patch)
NOTE: Running task 3355 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 3356 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3357 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 3358 of 3370 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_populate_sysroot', '/home/pok
 ybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot', '/home/pokybuild/yocto
 -worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot', '/hom
 e/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.01.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build
 /meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['avahi', 'bluez5', 'mobile-broadband-provider-info', 'ofono', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'libtool', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'libgudev', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', '
 libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'lame', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'libvorbis', 'mpg123', 'pulseaudio', 'sbc', 'speex', 'speexdsp', 'acl', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libatomic-ops', 'libcap-ng', 'libcap', 'libdaemon', 'libffi', 'libical', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'nghttp2', 'shared-mime-info', 'sqlite3', 'taglib', 'utfcpp', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'nasm-native', 'ninja-native', 'orc-native',
  'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'groff-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Daalib=disabled -Ddirectsound=disabled -Ddv=disabled -Dlibcaca=disabled -Doss=enabled -Doss4=disabled -Dosxaudio=disabled -Dosxvideo=disabled -Dshout2=disabled -Dtwolame=disabled -Dwaveform=disabled -Dasm=enabled -Dbz2=enabled -Dcairo=enabled -Ddv1394=disabled -Dflac=enabled -Dgdk-pixbuf=enabled -Dgtk3=disabled -Dv4l2-gudev=enabled -Djack=disabled -Djpeg=enabled -Dlame=enabled -Dpng=enabled -Dv4l2-libv4l2=disabled -Dmpg123=enabled -Dorc=enabled -Dpulse=enabled -Dqt5=disabled -Drpicamsrc=disabled -Dsoup=enabled -Dspeex=enabled -Dtaglib=enabled -Dv4l2=enabled -Dv4l2-probe=true -Dvpx=disabled -Dwavpack=disabled -Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/gst-plugins-good-1.24.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/build
| Build type: cross build
| Project name: gst-plugins-good
| Project version: 1.24.3
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/recipe-sysroot ld.bfd 2.42.0.20240216
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C++ supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "fcntl.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "process.h" : NO
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/ioctl.h" : YES
| Has header "sys/param.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/time.h" : YES
| Has header "sys/types.h" : YES
| Has header "unistd.h" : YES
| Library m found: YES
| Checking for function "asinh" with dependency -lm: YES
| Checking for function "clock_gettime" with dependency -lm: YES
| Checking for function "cosh" with dependency -lm: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "getpagesize" with dependency -lm: YES
| Checking for function "isinf" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "mmap64" with dependency -lm: NO
| Checking for function "sinh" with dependency -lm: YES
| Checking for function "gmtime_r" with dependency -lm: YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Checking for size of "short" : 2
| Checking for size of "void*" : 8
| Checking for size of "off_t" : -1
| Header "dlfcn.h" has symbol "RTLD_NOLOAD" : YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-good-1.24.3/meson.build:281:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132, line 171
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132, line 160
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132, line 184
NOTE: recipe gstreamer1.0-plugins-good-1.24.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3358 tasks of which 3348 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501140200.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501140200.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-good-1.24.3-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-good-1.24.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/run.do_configure.331132', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-good/1.24.3/temp/log.do_configure.331132
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb:do_configure) failed with exit code '1'

--===============6406672110004361906==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.22.11-1.24.3.patch"

RnJvbSAyNzQ5MGI3MjA4ZTI0ZWRhY2ViMjFlN2NiZTA3MGRjZGFmZTlmYzU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNDowMjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Q6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjI0LjMKCi0tLQog
Li4uaW5lLWlvY3RsX3JlcV90LWZvci1wb3NpeC1saW51eC1jYXNlLnBhdGNoIHwgMzggLS0tLS0t
LS0tLS0tLS0tLS0tLQogLi4uYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjMu
YmJ9IHwgIDUgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2QvMDAwMS12NGwyLURlZmluZS1pb2N0bF9yZXFf
dC1mb3ItcG9zaXgtbGludXgtY2FzZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjExLmJiID0+IGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
LzAwMDEtdjRsMi1EZWZpbmUtaW9jdGxfcmVxX3QtZm9yLXBvc2l4LWxpbnV4LWNhc2UucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZC8wMDAxLXY0bDItRGVmaW5lLWlvY3RsX3JlcV90LWZvci1wb3NpeC1saW51eC1jYXNlLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzM2JkNDIwMGY2Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1nb29kLzAwMDEtdjRsMi1EZWZpbmUtaW9jdGxfcmVxX3QtZm9yLXBvc2l4LWxpbnV4LWNh
c2UucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIGI3N2Q0ODA2ZmQ1
ZGU1MGQwYjAxN2EzZTZhMTljNWJmZGVmN2IzZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogTW9uLCAxMyBGZWIgMjAy
MyAxMjo0NzozMSAtMDgwMAotU3ViamVjdDogW1BBVENIXSB2NGwyOiBEZWZpbmUgaW9jdGxfcmVx
X3QgZm9yIHBvc2l4L2xpbnV4IGNhc2UKLQotdGhpcyBpcyBhbiBpc3N1ZSBzZWVuIHdpdGggbXVz
bCBiYXNlZCBsaW51eCBkaXN0cm9zIGUuZy4gYWxwaW5lIFsxXQotbXVzbCBpcyBub3QgZ29pbmcg
dG8gY2hhbmdlIHRoaXMgc2luY2UgaXQgYnJlYWtzIEFCSS9BUEkgaW50ZXJmYWNlcwotTmV3ZXIg
Y29tcGlsZXJzIGFyZSBzdHJpbmdlbnQgKCBlLmcuIGNsYW5nMTYgKSB3aGljaCBjYW4gbm93IGRl
dGVjdAotc2lnbmF0dXJlIG1pc21hdGNoZXMgaW4gZnVuY3Rpb24gcG9pbnRlcnMgdG9vLCBleGlz
dGluZyBjb2RlIHdhcm5lZCBidXQKLWRpZCBub3QgZXJyb3Igd2l0aCBvbGRlciBjbGFuZwotCi1G
aXhlcwotZ3N0djRsMm9iamVjdC5jOjU0NDoyMzogZXJyb3I6IGluY29tcGF0aWJsZSBmdW5jdGlv
biBwb2ludGVyIHR5cGVzIGFzc2lnbmluZyB0byAnZ2ludCAoKikoZ2ludCwgaW9jdGxfcmVxX3Qs
IC4uLiknIChha2EgJ2ludCAoKikoaW50LCB1bnNpZ25lZCBsb25nLCAuLi4pJykgZnJvbSAnaW50
IChpbnQsIGludCwgLi4uKScgWy1XaW5jb21wYXRpYmxlLWZ1bmN0aW9uLXBvaW50ZXItdHlwZXNd
Ci0gICAgdjRsMm9iamVjdC0+aW9jdGwgPSBpb2N0bDsKLSAgICAgICAgICAgICAgICAgICAgICBe
IH5+fn5+Ci0KLVsxXSBodHRwczovL2dpdGxhYi5hbHBpbmVsaW51eC5vcmcvYWxwaW5lL2Fwb3J0
cy8tL2lzc3Vlcy83NTgwCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3Rz
LzM5NTBdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotCi0t
LS0KLSBzeXMvdjRsMi9nc3R2NGwyb2JqZWN0LmggfCAyICsrCi0gMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3lzL3Y0bDIvZ3N0djRsMm9iamVjdC5oIGIv
c3lzL3Y0bDIvZ3N0djRsMm9iamVjdC5oCi1pbmRleCBkOTViMzc1Li41MjIzY2JiIDEwMDY0NAot
LS0tIGEvc3lzL3Y0bDIvZ3N0djRsMm9iamVjdC5oCi0rKysgYi9zeXMvdjRsMi9nc3R2NGwyb2Jq
ZWN0LmgKLUBAIC03Niw2ICs3Niw4IEBAIHR5cGVkZWYgZ2Jvb2xlYW4gICgqR3N0VjRsMlVwZGF0
ZUZwc0Z1bmN0aW9uKSAoR3N0VjRsMk9iamVjdCAqIHY0bDJvYmplY3QpOwotICAqICd1bnNpZ25l
ZCBsb25nJyBmb3IgdGhlIDJuZCBwYXJhbWV0ZXIgKi8KLSAjaWZkZWYgX19BTkRST0lEX18KLSB0
eXBlZGVmIHVuc2lnbmVkIGlvY3RsX3JlcV90OwotKyNlbGlmIGRlZmluZWQoX19saW51eF9fKSAm
JiAhZGVmaW5lZChfX0dMSUJDX18pIC8qIG11c2wvbGludXggKi8KLSt0eXBlZGVmIGludCBpb2N0
bF9yZXFfdDsKLSAjZWxzZQotIHR5cGVkZWYgZ3Vsb25nIGlvY3RsX3JlcV90OwotICNlbmRpZgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjExLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjMuYmIKaW5k
ZXggOWNlM2Y3M2Y3Yy4uMzRhZjYxOGYwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yMi4xMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI0LjMuYmIKQEAgLTQsMTAgKzQsOSBAQCBTVU1NQVJZID0gIidHb29kJyBHU3RyZWFt
ZXIgcGx1Z2lucyIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9y
Zy8iCiBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFt
ZXIvZ3N0LXBsdWdpbnMtZ29vZC8tL2lzc3VlcyIKIAotU1JDX1VSSSA9ICJodHRwczovL2dzdHJl
YW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdvb2QvZ3N0LXBsdWdpbnMtZ29v
ZC0ke1BWfS50YXIueHogXAotICAgICAgICAgICBmaWxlOi8vMDAwMS12NGwyLURlZmluZS1pb2N0
bF9yZXFfdC1mb3ItcG9zaXgtbGludXgtY2FzZS5wYXRjaCIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9n
c3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1nb29kL2dzdC1wbHVnaW5z
LWdvb2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmRkZDAzMjM4MTgy
N2QzMTgyMDU0MDczNWYwMDA0YjQyOTQzNmIwYmRhYzE5YWFlYWI0NGZhMjJmYWFkNTJlMiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxNTBmOTE0ZTYxZGMwNTYwMGI2OGI4OGNhMTAzYzdjYzIyNzEz
MDE1OGUzODllYTllYTE1OWY0MDUwYTJlYmIwIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdp
bnMtZ29vZC0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============6406672110004361906==--

