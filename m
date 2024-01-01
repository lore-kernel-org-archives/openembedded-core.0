Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A36C4828A
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4629.1704114719584323553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cIwJhOFd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ij0c0JlV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cc5270e72-afb5fa49-fb30-4df7-8663-a09c0de08815-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MmZx1h2lcS7v+3uGrrCTIMH0GuC4hzD2HHCYGvnD0jk=;
	b=cIwJhOFdExJWRtwvzyg/0fpoBxK4wueJmTzjb5nxK+YqOPGsQT0XESDB4VU01QyX
	sOtTqrMvIlyOovPN3Yzc7PKKBmI9xvIn15raRCZg+91shTFxrH+cVVsOZJFi3mSdIU3
	EqR/t2vZfSPdbN9qglwjkE9G64bVYsVBK6fHTudU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MmZx1h2lcS7v+3uGrrCTIMH0GuC4hzD2HHCYGvnD0jk=;
	b=ij0c0JlVS2i8D6gXl+xW7IzFw+NV8UphO5cz5aAQQx6geRmEOQyHjMsn6qiIpClM
	jmDNB3lk3eSHq77XnAPEQ8YGvTb01bOp3XnUeFi+rcmkfo6P9DlqBmpbNqwGx5+uf4a
	bAw4w95YyUu2o9xqbRxOF7o91Uy9uieARAlmG+As=
Content-Type: multipart/mixed; boundary="===============2802655668801237302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.0 FAILED
Message-ID: <0101018cc5270e72-afb5fa49-fb30-4df7-8663-a09c0de08815-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193143

--===============2802655668801237302==
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
From 7d74ba95cc6f9a2ba85436ecd1494761dd674591 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 10:08:14 +0000
Subject: [PATCH] weston: upgrade 12.0.2 -> 13.0.0

---
 ...ools-Include-libgen.h-for-basename-signat.patch | 14 ++++++--------
 .../wayland/{weston_12.0.2.bb => weston_13.0.0.bb} |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.2.bb => weston_13.0.0.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..c90f216f7b 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From 160d8112cb922165f4b09250771d956b48fec59a Mon Sep 17 00:00:00 2001
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


--===============2802655668801237302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7d668bebcfb3689066a1049fa95fd7ab6dbcdee2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7d668bebcfb3689066a1049fa95fd7ab6dbcdee2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 413 Local 401 Mirrors 0 Missed 12 Current 746 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2753 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_recipe_qa)
NOTE: Running task 2901 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_write_config)
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa: Started
NOTE: recipe weston-13.0.0-r0: task do_write_config: Started
NOTE: recipe weston-13.0.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_recipe_qa unihash changed to ddd43e56afd0143d5cc03d2705a5ab1473fb073f70ea6b6ead0316107eadcf9d
NOTE: Setscene tasks completed
NOTE: Running task 3128 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_fetch)
NOTE: recipe weston-13.0.0-r0: task do_fetch: Started
NOTE: recipe weston-13.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3129 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_unpack)
NOTE: Running task 3130 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-13.0.0-r0: task do_unpack: Started
NOTE: recipe weston-13.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-13.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 3131 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_patch)
NOTE: Running task 3132 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-13.0.0-r0: task do_patch: Started
NOTE: recipe weston-13.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-13.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_patch: Succeeded
NOTE: Running task 3133 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3134 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_populate_lic)
NOTE: recipe weston-13.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_populate_lic unihash changed to d47c14e312dcb8644c48de1c6bfbec68907a2121af7a01209e9f8b39f8a4e114
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_deploy_source_date_epoch unihash changed to f70278516e3ac1168e9a986b4fcb519e6b66528b0585d4bd3569c86b876c0245
NOTE: Setscene tasks completed
NOTE: Running task 3135 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure)
NOTE: recipe weston-13.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/poky
 build/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor
 ker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor
 ker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools
 /python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'seatd', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcursor', 'libxcvt', 'libxdamage', 'libxdmcp
 ', 'libxext', 'libxfixes', 'libxfont2', 'libxft', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xcb-util-cursor', 'xcb-util-image', 'xcb-util-renderutil', 'xcb-util', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xwayland', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libcheck', 'libevdev', 'libffi', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native'
 , 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dsimple-clients=all -Ddemo-clients=true -Ddeprecated-color-management-colord=false -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dlauncher-libseat=true -Ddeprecated-launcher-logind=false -Dcolor-management-lcms=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Dscreenshare=true -Dshell-desktop=true -Dshell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dsystemd=true -Dbackend-drm-screencast-vaapi=false -Dbackend-vnc=false -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| DEPRECATION: "pkgconfig" entry is deprecated and should be replaced by "pkg-config"
| DEPRECATION: "pkgconfig" entry is deprecated and should be replaced by "pkg-config"
| The Meson build system
| Version: 1.3.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/weston-13.0.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/build
| Build type: cross build
| 
| ../weston-13.0.0/meson.build:1:0: ERROR: Unknown options: "deprecated-launcher-logind, launcher-libseat"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174, line 172
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174, line 161
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174, line 147
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174, line 185
NOTE: recipe weston-13.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3135 tasks of which 3125 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101100750.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101100750.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-13.0.0-r0 do_configure: meson failed
ERROR: weston-13.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.1992174', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/log.do_configure.1992174
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure) failed with exit code '1'

--===============2802655668801237302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-12.0.2-13.0.0.patch"

RnJvbSA3ZDc0YmE5NWNjNmY5YTJiYTg1NDM2ZWNkMTQ5NDc2MWRkNjc0NTkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMDowODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMi4wLjIgLT4gMTMuMC4wCgotLS0KIC4uLm9vbHMtSW5jbHVkZS1saWJn
ZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoIHwgMTQgKysrKysrLS0tLS0tLS0KIC4uLi93
YXlsYW5kL3t3ZXN0b25fMTIuMC4yLmJiID0+IHdlc3Rvbl8xMy4wLjAuYmJ9IHwgIDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTIuMC4yLmJiID0+IHdlc3Rvbl8x
My4wLjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2Vu
YW1lLXNpZ25hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8w
MDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQu
cGF0Y2gKaW5kZXggMWQyODFmYTgzMi4uYzkwZjIxNmY3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUt
bGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4u
aC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYjUzMjM2
YWM2MzdkZmE3ZmIwZjQzOGY3MzkxYTczZjZlZjkyYTA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxNjBkODExMmNiOTIyMTY1ZjRiMDkyNTA3NzFkOTU2YjQ4ZmVjNTlhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFRodSwgMTQgRGVjIDIwMjMgMDk6MTM6NTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGli
d2VzdG9uLHRvb2xzOiBJbmNsdWRlIGxpYmdlbi5oIGZvciBiYXNlbmFtZSBzaWduYXR1cmUKQEAg
LTE0LDEzICsxNCwxNCBAQCBDbGFuZy0xNysgYXMgaXQgdHJlYXRzIC1XaW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb24gYXMgZXJyb3IKIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rvbi8tL21lcmdlX3JlcXVl
c3RzLzE0MjBdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgor
CiAtLS0KICBsaWJ3ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMgfCAxICsKICB0b29s
cy96dW5pdGMvc3JjL3p1bml0Y19pbXBsLmMgICAgICAgfCAxICsKICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xp
YmJhY2tsaWdodC5jIGIvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCi1pbmRl
eCBjYTdmMmQ2OC4uNzQ2OTBmYTcgMTAwNjQ0CitpbmRleCBjYTdmMmQ2Li43NDY5MGZhIDEwMDY0
NAogLS0tIGEvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCiArKysgYi9saWJ3
ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMKIEBAIC00MSw2ICs0MSw3IEBACkBAIC0z
MCwxOSArMzEsMTYgQEAgaW5kZXggY2E3ZjJkNjguLjc0NjkwZmE3IDEwMDY0NAogKyNpbmNsdWRl
IDxsaWJnZW4uaD4KICAjaW5jbHVkZSA8c3RyaW5nLmg+CiAgI2luY2x1ZGUgPGVycm5vLmg+Ci0K
KyAKIGRpZmYgLS1naXQgYS90b29scy96dW5pdGMvc3JjL3p1bml0Y19pbXBsLmMgYi90b29scy96
dW5pdGMvc3JjL3p1bml0Y19pbXBsLmMKLWluZGV4IDE4ZjAzMDE1Li45YjQ2MGZhMCAxMDA2NDQK
K2luZGV4IDE4ZjAzMDEuLjliNDYwZmEgMTAwNjQ0CiAtLS0gYS90b29scy96dW5pdGMvc3JjL3p1
bml0Y19pbXBsLmMKICsrKyBiL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwuYwogQEAgLTI3
LDYgKzI3LDcgQEAKLQorIAogICNpbmNsdWRlIDxlcnJuby5oPgogICNpbmNsdWRlIDxmY250bC5o
PgogKyNpbmNsdWRlIDxsaWJnZW4uaD4KICAjaW5jbHVkZSA8c3RkYXJnLmg+CiAgI2luY2x1ZGUg
PHN0ZGJvb2wuaD4KICAjaW5jbHVkZSA8c3RkaW8uaD4KLS0tCi0yLjQzLjAKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEyLjAuMi5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEy
LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEz
LjAuMC5iYgppbmRleCBjZmNhYWNhOWM3Li42M2UxODMwNzk4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTIuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JD
X1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9y
ZWxlYXNlcy8ke1BWfS9kb3dubG8KICAgICAgICAgICAgZmlsZTovL3N5c3RlbWQtbm90aWZ5Lndl
c3Rvbi1zdGFydCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImViNjg2
YTdjZjAwOTkyYTIzYjE3ZjE5MmZjYTlhODg3MzEzZTkyYzM0NmVlMzVkODU3NTE5Njk4M2Q2NTZi
NGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTJmZjFkNGFhMjM5NGEyZTQxNmM4NWEzMzhiNjI3
Y2U5N2ZhNzFkNDNlYjc2MmZkNGFhZjE0NWQzNmZjNzk1YSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vd2F5bGFuZC5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMuaHRtbCIKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gIndlc3Rvbi0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCsp
IgotLSAKMi40Mi4wCgo=

--===============2802655668801237302==--

