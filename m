Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB112C47DDB
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88296.1705340031395213567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O//yBn6J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jwilC/+u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fcf29-8ca0a678-936e-45e5-999e-821a0d72006f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6U/I/91W3KyLryanzkhHLUsJ6ynG//XDbtEj16zNNKU=;
	b=O//yBn6JUIxrhcgEp7sY7j/OIFQSjeSDTqG3Ry71iVrAOqc6KvgtNtRax4q7AaCI
	mrs+js354KJbK3jQWg42ebr6jkUqH6qLNorz+QRGCXVHkcJpB5hRydTfzMVK9584m6G
	42WpkfBg11ixdwJysMXE4Gv4HZFwb2fKw5PeA4Ts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6U/I/91W3KyLryanzkhHLUsJ6ynG//XDbtEj16zNNKU=;
	b=jwilC/+uITHBffH3WSpdob9CPJS77GC7ECgVLZo+sf0x2r9qd5rVCM0P9zgOBWbv
	iHRPI+6qr5OQTlYVb2cGWhflT+HSzALilqDcjEy6YISQFDzHKrv8j/IemsWB8JTzAmj
	q3izZDdPHJmuBK5CR0nFysfYwa/hpL/imvdO+kxM=
Content-Type: multipart/mixed; boundary="===============6918414240139856103=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.0 FAILED
Message-ID: <0101018d0e2fcf29-8ca0a678-936e-45e5-999e-821a0d72006f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193772

--===============6918414240139856103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *13.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-12.0.2-13.0.0.patch
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
From d816fbc931d9e208e9698dffbbfcab11824ee97c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 13:00:07 +0000
Subject: [PATCH] weston: upgrade 12.0.2 -> 13.0.0

---
 ...ools-Include-libgen.h-for-basename-signat.patch | 14 ++++++--------
 .../wayland/{weston_12.0.2.bb => weston_13.0.0.bb} |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.2.bb => weston_13.0.0.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..70b01ea379 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From 1082849aecc7f1939ebae3c96312ddb0f38af64f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
@@ -14,13 +14,14 @@ Clang-17+ as it treats -Wimplicit-function-declaration as error
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1420]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  libweston/backend-drm/libbacklight.c | 1 +
  tools/zunitc/src/zunitc_impl.c       | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d68..74690fa7 100644
+index ca7f2d6..74690fa 100644
 --- a/libweston/backend-drm/libbacklight.c
 +++ b/libweston/backend-drm/libbacklight.c
 @@ -41,6 +41,7 @@
@@ -30,19 +31,16 @@ index ca7f2d68..74690fa7 100644
 +#include <libgen.h>
  #include <string.h>
  #include <errno.h>
-
+ 
 diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f03015..9b460fa0 100644
+index 18f0301..9b460fa 100644
 --- a/tools/zunitc/src/zunitc_impl.c
 +++ b/tools/zunitc/src/zunitc_impl.c
 @@ -27,6 +27,7 @@
-
+ 
  #include <errno.h>
  #include <fcntl.h>
 +#include <libgen.h>
  #include <stdarg.h>
  #include <stdbool.h>
  #include <stdio.h>
---
-2.43.0
-
diff --git a/meta/recipes-graphics/wayland/weston_12.0.2.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_12.0.2.bb
rename to meta/recipes-graphics/wayland/weston_13.0.0.bb
index cfcaaca9c7..63e1830798 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8575196983d656b4a"
+SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.42.0


--===============6918414240139856103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1851 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1850 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fc3e14ac6765e671f7ba65634cf52807f64d254a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fc3e14ac6765e671f7ba65634cf52807f64d254a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 424 Local 413 Mirrors 0 Missed 11 Current 740 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 833 of 1164 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2759 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_fetch)
NOTE: Running task 2915 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_write_config)
NOTE: recipe weston-13.0.0-r0: task do_fetch: Started
NOTE: recipe weston-13.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3144 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_unpack)
NOTE: Running task 3145 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-13.0.0-r0: task do_write_config: Started
NOTE: recipe weston-13.0.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_unpack: Started
NOTE: recipe weston-13.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-13.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 3146 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_patch)
NOTE: Running task 3147 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-13.0.0-r0: task do_patch: Started
NOTE: recipe weston-13.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-13.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_patch: Succeeded
NOTE: Running task 3148 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3149 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_populate_lic)
NOTE: recipe weston-13.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_populate_lic unihash changed to d47c14e312dcb8644c48de1c6bfbec68907a2121af7a01209e9f8b39f8a4e114
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_deploy_source_date_epoch unihash changed to f70278516e3ac1168e9a986b4fcb519e6b66528b0585d4bd3569c86b876c0245
NOTE: Setscene tasks completed
NOTE: Running task 3150 of 3165 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure)
NOTE: recipe weston-13.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/poky
 build/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-w
 orker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-w
 orker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtoo
 ls/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'seatd', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcursor', 'libxcvt', 'libxdamage', 'libxdmcp
 ', 'libxext', 'libxfixes', 'libxfont2', 'libxft', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xcb-util-cursor', 'xcb-util-image', 'xcb-util-renderutil', 'xcb-util', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xwayland', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libcheck', 'libevdev', 'libffi', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native'
 , 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dsimple-clients=all -Ddemo-clients=true -Ddeprecated-color-management-colord=false -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dlauncher-libseat=true -Ddeprecated-launcher-logind=false -Dcolor-management-lcms=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Dscreenshare=true -Dshell-desktop=true -Dshell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dsystemd=true -Dbackend-drm-screencast-vaapi=false -Dbackend-vnc=false -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/weston-13.0.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/build
| Build type: cross build
| 
| ../weston-13.0.0/meson.build:1:0: ERROR: Unknown options: "deprecated-launcher-logind, launcher-libseat"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225, line 186
NOTE: recipe weston-13.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3150 tasks of which 3141 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115125945.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115125945.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-13.0.0-r0 do_configure: meson failed
ERROR: weston-13.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.2120225', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/log.do_configure.2120225
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure) failed with exit code '1'

--===============6918414240139856103==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-12.0.2-13.0.0.patch"

RnJvbSBkODE2ZmJjOTMxZDllMjA4ZTk2OThkZmZiYmZjYWIxMTgyNGVlOTdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6MDA6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTIuMC4yIC0+IDEzLjAuMAoKLS0tCiAuLi5vb2xzLUluY2x1ZGUtbGli
Z2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCB8IDE0ICsrKysrKy0tLS0tLS0tCiAuLi4v
d2F5bGFuZC97d2VzdG9uXzEyLjAuMi5iYiA9PiB3ZXN0b25fMTMuMC4wLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEyLjAuMi5iYiA9PiB3ZXN0b25f
MTMuMC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNl
bmFtZS1zaWduYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24v
MDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0
LnBhdGNoCmluZGV4IDFkMjgxZmE4MzIuLjcwYjAxZWEzNzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRl
LWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2Vu
LmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmI1MzIz
NmFjNjM3ZGZhN2ZiMGY0MzhmNzM5MWE3M2Y2ZWY5MmEwNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMTA4Mjg0OWFlY2M3ZjE5MzllYmFlM2M5NjMxMmRkYjBmMzhhZjY0ZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBUaHUsIDE0IERlYyAyMDIzIDA5OjEzOjU0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxp
Yndlc3Rvbix0b29sczogSW5jbHVkZSBsaWJnZW4uaCBmb3IgYmFzZW5hbWUgc2lnbmF0dXJlCkBA
IC0xNCwxMyArMTQsMTQgQEAgQ2xhbmctMTcrIGFzIGl0IHRyZWF0cyAtV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uIGFzIGVycm9yCiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFto
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9tZXJnZV9yZXF1
ZXN0cy8xNDIwXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
KwogLS0tCiAgbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jIHwgMSArCiAgdG9v
bHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jICAgICAgIHwgMSArCiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9s
aWJiYWNrbGlnaHQuYyBiL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9saWJiYWNrbGlnaHQuYwotaW5k
ZXggY2E3ZjJkNjguLjc0NjkwZmE3IDEwMDY0NAoraW5kZXggY2E3ZjJkNi4uNzQ2OTBmYSAxMDA2
NDQKIC0tLSBhL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9saWJiYWNrbGlnaHQuYwogKysrIGIvbGli
d2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCiBAQCAtNDEsNiArNDEsNyBAQApAQCAt
MzAsMTkgKzMxLDE2IEBAIGluZGV4IGNhN2YyZDY4Li43NDY5MGZhNyAxMDA2NDQKICsjaW5jbHVk
ZSA8bGliZ2VuLmg+CiAgI2luY2x1ZGUgPHN0cmluZy5oPgogICNpbmNsdWRlIDxlcnJuby5oPgot
CisgCiBkaWZmIC0tZ2l0IGEvdG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jIGIvdG9vbHMv
enVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCi1pbmRleCAxOGYwMzAxNS4uOWI0NjBmYTAgMTAwNjQ0
CitpbmRleCAxOGYwMzAxLi45YjQ2MGZhIDEwMDY0NAogLS0tIGEvdG9vbHMvenVuaXRjL3NyYy96
dW5pdGNfaW1wbC5jCiArKysgYi90b29scy96dW5pdGMvc3JjL3p1bml0Y19pbXBsLmMKIEBAIC0y
Nyw2ICsyNyw3IEBACi0KKyAKICAjaW5jbHVkZSA8ZXJybm8uaD4KICAjaW5jbHVkZSA8ZmNudGwu
aD4KICsjaW5jbHVkZSA8bGliZ2VuLmg+CiAgI2luY2x1ZGUgPHN0ZGFyZy5oPgogICNpbmNsdWRl
IDxzdGRib29sLmg+CiAgI2luY2x1ZGUgPHN0ZGlvLmg+Ci0tLQotMi40My4wCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMi4wLjIuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8x
Mi4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8x
My4wLjAuYmIKaW5kZXggY2ZjYWFjYTljNy4uNjNlMTgzMDc5OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEyLjAuMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNS
Q19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2VzdG9uLy0v
cmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLW5vdGlmeS53
ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYjY4
NmE3Y2YwMDk5MmEyM2IxN2YxOTJmY2E5YTg4NzMxM2U5MmMzNDZlZTM1ZDg1NzUxOTY5ODNkNjU2
YjRhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyZmYxZDRhYTIzOTRhMmU0MTZjODVhMzM4YjYy
N2NlOTdmYTcxZDQzZWI3NjJmZDRhYWYxNDVkMzZmYzc5NWEiCiAKIFVQU1RSRUFNX0NIRUNLX1VS
SSA9ICJodHRwczovL3dheWxhbmQuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLmh0bWwiCiBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJ3ZXN0b24tKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQr
KSIKLS0gCjIuNDIuMAoK

--===============6918414240139856103==--

