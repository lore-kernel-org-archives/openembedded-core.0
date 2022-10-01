Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E0AC38A2E
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.420.1664643227316000309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZWSnuPXU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101839477e31b-585cca22-31db-48af-9751-e08100bef518-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/FkjDvzKFQ9D/v7KfXNCR5Wap9eAqFENUVgr8OyFfUI=;
	b=ZWSnuPXUdT8mCWFjhIxM5nXlN8ui3AnLa8gn1zSQQ9MCe3B8YjALfPzHYN1NPVRI
	d58Yu2C/ez9E3SKx+gP63izkJjlLHsp/6aNsR94v2anxDSpTXgZhcbvIDNJVgQSEi67
	SiHzgZNfXnGWmtcgfQbNN29wrmfpMgj6mRlIypRM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/FkjDvzKFQ9D/v7KfXNCR5Wap9eAqFENUVgr8OyFfUI=;
	b=NeMf5XzzUGn2U6JtRsfsi6neLwDM08tEp8Pz9nAqxBYcI8huHKq7pJ0c9FDIvvVd
	yFuK/f3gn98bMr9u4Jx0LDIg3m44Gye9tZPKL7TytnRpT5OzUPCdCzqkq5kH/7c2mUd
	efOek9K+Ffl/fPwjpqcd6h1AbL6DLbHMkUTvLae0=
Content-Type: multipart/mixed; boundary="===============8367411977012345648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 11.0.0 FAILED
Message-ID: 
 <010101839477e31b-585cca22-31db-48af-9751-e08100bef518-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171321

--===============8367411977012345648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *11.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-10.0.2-11.0.0.patch
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
--===============8367411977012345648==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-10.0.2-11.0.0.patch"

RnJvbSAwOTE3NDA3MjMwMGY4YzQzZDE1ZWVkNzcwNmU0NmQyMTYyYWM1YjlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMzo0MTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMC4wLjIgLT4gMTEuMC4wCgotLS0KIC4uLi93YXlsYW5kL3t3ZXN0b25f
MTAuMC4yLmJiID0+IHdlc3Rvbl8xMS4wLjAuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTAuMC4yLmJiID0+IHdlc3Rvbl8xMS4wLjAu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2Vz
dG9uXzEwLjAuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMS4w
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2VzdG9uXzEwLjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2VzdG9uXzExLjAuMC5iYgppbmRleCA3ODZkMTJiZTYxLi4zNTA1YWQ1NzMy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTAuMC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMS4wLjAuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvd2F5bGFuZC93ZXN0b24vLS9yZWxlYXNlcy8ke1BWfS9kb3dubG8KICAgICAgICAgICAgZmls
ZTovL3N5c3RlbWQtbm90aWZ5Lndlc3Rvbi1zdGFydCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjg5NjQ2Y2EwZDlmOGQ0MTNjMjc2N2U1YzM4MjhlYWEzZmExNDljMmEx
MDViMzcyOWE2ODk0ZmE3Y2YxNTQ5ZTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTYxMzhkNGRj
OTU1NDU2MGFjMzA0MzEyZGY0NTYwMTlmNGJlMDI1ZWM3OTEzMGYwNWZiNWYyZTQxYzA5MWUxZCIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd2F5bGFuZC5mcmVlZGVza3RvcC5vcmcv
cmVsZWFzZXMuaHRtbCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIndlc3Rvbi0oP1A8cHZlcj5c
ZCtcLlxkK1wuKD8hOVxkKylcZCspIgotLSAKMi4zMS4xCgo=

--===============8367411977012345648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3b294780e32cc62a0e39d351bfcc47464abf251d"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 202 Local 195 Mirrors 0 Missed 7 Current 447 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2089 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_fetch)
NOTE: Running task 2177 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_write_config)
NOTE: recipe weston-11.0.0-r0: task do_fetch: Started
NOTE: recipe weston-11.0.0-r0: task do_write_config: Started
NOTE: recipe weston-11.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2260 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_unpack)
NOTE: Running task 2261 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-11.0.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-11.0.0-r0: task do_unpack: Started
NOTE: recipe weston-11.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-11.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_patch)
NOTE: recipe weston-11.0.0-r0: task do_patch: Started
NOTE: recipe weston-11.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_populate_lic)
NOTE: recipe weston-11.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-11.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-11.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-11.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe weston-11.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_configure)
NOTE: recipe weston-11.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/a
 uh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-g
 raphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:
 do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'dbus', 'glib-2.0', 'glibc', 'seatd', 'systemd', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'shadow-sysroot', 'shadow', 'gdk-pixbuf', 'cairo', 'libdrm', 'libjpeg-turbo', 'mesa', 'pango', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'libx11', 'libxcb', 'libxcursor', 'libxkbcommon', 'pixman', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'shadow-native', 'xz-native', 'wayland-native', 'xorgproto', 'util-macros', 'autoconf-archive', 'xtrans', 'initscripts', 'update-rc.d', 're2c-native', 'glib-2.0-native', 'zlib-native', 'expat', 'libsm', 'fontconfig', 'fribidi', 'harfbuzz', 'freetype', 'libxft', 'gobject-introspection', 'gnu-config-native', 'flex-native', 'libmpc-native', 'libtool-native', 'gmp-native', 'mpfr-native', 'binutils-cross-i686', 'zstd-native', 'texinfo-dummy-native', 'linux-libc-headers', 'libxdmcp', 'xcb-proto', '
 libpthread-stubs', 'libxau', 'vulkan-loader', 'xrandr', 'libxdamage', 'libxfixes', 'libxxf86vm', 'libxshmfence', 'zlib', 'vulkan-headers', 'libxext', 'libffi', 'util-linux', 'libpcre', 'bash-completion', 'xkeyboard-config', 'libxml2', 'libxml2-native', 'expat-native', 'libffi-native', 'opkg-utils', 'kmod', 'zstd', 'libcap', 'acl', 'libpam', 'libseccomp', 'libpng', 'libxrender', 'shared-mime-info', 'libgcc', 'sqlite3-native', 'libtirpc-native', 'ncurses-native', 'openssl-native', 'readline-native', 'gdbm-native', 'bzip2-native', 'libnsl2-native', 'util-linux-libuuid-native', 'libxcrypt', 'attr', 'attr-native', 'gettext-minimal-native', 'libpciaccess', 'python3-setuptools-native', 'python3-wheel-native', 'python3-installer-native', 'python3-picobuild-native', 'libcheck', 'libevdev', 'util-linux-native', 'gettext-native', 'libpcre-native', 'libice', 'icu', 'python3', 'm4-native', 'libxrandr', 'util-linux-libuuid', 'ncurses', 'libcap-ng', 'bzip2', 'cmake-native', 'xz', 'flex', 'cracklib
 ', 'perl-native', 'python3-flit-core-native', 'libpcre2-native', 'libcap-ng-native', 'sqlite3', 'libnsl2', 'libtirpc', 'readline', 'openssl', 'gdbm', 'curl-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dsimple-clients=all -Ddemo-clients=true -Dcolor-management-colord=false -Drenderer-gl=true -Ddeprecated-backend-fbdev=false -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Ddeprecated-weston-launch=false -Dlauncher-libseat=true -Dcolor-management-lcms=false -Dbackend-rdp=false -Dremoting=false -Dscreenshare=true -Dshell-desktop=true -Dshell-fullscreen=true -Dshell-ivi=true -Dsystemd=true -Dlauncher-logind=true -Dbackend-drm-screencast-vaapi=false -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/weston-11.0.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/build
| Build type: cross build
| 
| ../weston-11.0.0/meson.build:1:0: ERROR: Unknown options: "color-management-colord, deprecated-backend-fbdev, deprecated-weston-launch"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350, line 187
NOTE: recipe weston-11.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2265 tasks of which 2257 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: weston-11.0.0-r0 do_configure: meson failed
ERROR: weston-11.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/run.do_configure.3722350', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/11.0.0-r0/temp/log.do_configure.3722350
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_11.0.0.bb:do_configure) failed with exit code '1'

--===============8367411977012345648==--

