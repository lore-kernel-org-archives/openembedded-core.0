Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BDFC47255
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63131.1702649862574479820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=INC0f7os;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I5NR4qEu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018c6dd72e8e-3f08769e-25fa-48e8-b03a-eccbc38ce528-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DjrCEjNmxtIu7nREw8trMYmUL0edvwJpQARW5/noTOI=;
	b=INC0f7osCz4nfDhh+xjk3gmr9B6Bhxeo/NmAZGl/3TvX9RGAK1KjX9MsYnUL8tlb
	AwvJzwhL8ekV/R9geRf/xMpMOjwpVYq1xLka5PHyCKkDOCHG+0B+FJdUmjTj2mXyYJ8
	/AmT6APBAeUmKo5f1otb0Si2+5vMdkhUWIj6agA8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DjrCEjNmxtIu7nREw8trMYmUL0edvwJpQARW5/noTOI=;
	b=I5NR4qEu669Qbv9zs/xCAUGhK5VVCSwyOBwxOT3AosXO8b0lYfdnHUJo3sJ2N1nL
	l3FJes36TmzpIzQcwNVjGecccIo7aftGvW4/S8M9Nw9jNJTiVQHXleyX/UFlewP/gTo
	KRB2Qb8JGABbYtbOlMPsmMnmtogDOVprAvO/yNEg=
Content-Type: multipart/mixed; boundary="===============2635774967833619903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.0 FAILED
Message-ID: <0101018c6dd72e8e-3f08769e-25fa-48e8-b03a-eccbc38ce528-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192502

--===============2635774967833619903==
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
From 4cb15e5704cb09a4691bf271d31809a52b438fba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 11:14:26 +0000
Subject: [PATCH] weston: upgrade 12.0.2 -> 13.0.0

---
 .../wayland/{weston_12.0.2.bb => weston_13.0.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.2.bb => weston_13.0.0.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.2.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_12.0.2.bb
rename to meta/recipes-graphics/wayland/weston_13.0.0.bb
index 5a179e6770..69638035fb 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8575196983d656b4a"
+SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.42.0


--===============2635774967833619903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-12.0.2-13.0.0.patch"

RnJvbSA0Y2IxNWU1NzA0Y2IwOWE0NjkxYmYyNzFkMzE4MDlhNTJiNDM4ZmJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTE6MTQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTIuMC4yIC0+IDEzLjAuMAoKLS0tCiAuLi4vd2F5bGFuZC97d2VzdG9u
XzEyLjAuMi5iYiA9PiB3ZXN0b25fMTMuMC4wLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEyLjAuMi5iYiA9PiB3ZXN0b25fMTMuMC4w
LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dl
c3Rvbl8xMi4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMu
MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMi4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjAuYmIKaW5kZXggNWExNzllNjc3MC4uNjk2MzgwMzVm
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEyLjAu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4wLmJi
CkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZp
bGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJlYjY4NmE3Y2YwMDk5MmEyM2IxN2YxOTJmY2E5YTg4NzMxM2U5MmMz
NDZlZTM1ZDg1NzUxOTY5ODNkNjU2YjRhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyZmYxZDRh
YTIzOTRhMmU0MTZjODVhMzM4YjYyN2NlOTdmYTcxZDQzZWI3NjJmZDRhYWYxNDVkMzZmYzc5NWEi
CiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3dheWxhbmQuZnJlZWRlc2t0b3Aub3Jn
L3JlbGVhc2VzLmh0bWwiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ3ZXN0b24tKD9QPHB2ZXI+
XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuNDIuMAoK

--===============2635774967833619903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-cf470c5b663c79fa6d930dcbe6a37b93674afb59"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf470c5b663c79fa6d930dcbe6a37b93674afb59"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 402 Local 391 Mirrors 0 Missed 11 Current 757 (97% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 850 of 1159 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2757 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_fetch)
NOTE: Running task 2902 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_write_config)
NOTE: recipe weston-13.0.0-r0: task do_fetch: Started
NOTE: recipe weston-13.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3129 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_unpack)
NOTE: Running task 3130 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-13.0.0-r0: task do_write_config: Started
NOTE: recipe weston-13.0.0-r0: task do_write_config: Succeeded
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
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-13.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_populate_lic unihash changed to d47c14e312dcb8644c48de1c6bfbec68907a2121af7a01209e9f8b39f8a4e114
NOTE: recipe weston-13.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_deploy_source_date_epoch unihash changed to f70278516e3ac1168e9a986b4fcb519e6b66528b0585d4bd3569c86b876c0245
NOTE: Setscene tasks completed
NOTE: Running task 3135 of 3150 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure)
NOTE: recipe weston-13.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/poky
 build/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor
 ker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor
 ker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206, line 172
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206, line 161
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206, line 147
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206, line 185
NOTE: recipe weston-13.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3135 tasks of which 3126 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215111404.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215111404.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-13.0.0-r0 do_configure: meson failed
ERROR: weston-13.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/run.do_configure.3449206', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/13.0.0/temp/log.do_configure.3449206
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.0.bb:do_configure) failed with exit code '1'

--===============2635774967833619903==--

