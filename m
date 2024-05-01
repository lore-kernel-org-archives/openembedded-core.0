Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012B8C27C4E
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1109.1714579216018214838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lp6JGGCT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gvXzfEfR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f34e297eb-fb60cd8e-0560-458a-8238-894cc85c0ebc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HWZIWi+kSab2+VnpB/vpEQEUXjiHZQz/gGwMl3u1qB0=;
	b=Lp6JGGCTE8fGjkvITrsen6VhqRRpnurq2I917Oj8gEjFXidjHNkPKrX0v6mFklVI
	3tm5qJh4aZWQKxnhj5LXtGOG4MPwpd+CiOhUL6Y3NGqG2+jRLJEFfWdxJTMweMTFJlL
	T+g62mlcfu/VHMZu0PBCan+BIcQjL80Wq2vM0bgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HWZIWi+kSab2+VnpB/vpEQEUXjiHZQz/gGwMl3u1qB0=;
	b=gvXzfEfRSbgCpq2gcHkgwwwpTuDegB4g4OtZW5Y9bdAaPe76Xvr2gDHOYzHgHNCR
	GN5xoT/FG96Ak5Da7fRW9iGH3p2vXKPThvpDTVO9mSDAF1fsev4vuIxlQ0bbtB5LiSi
	JmyJGQkEgMONo19iuTrYG7q8g8vyG2uYUTNONOjM=
Content-Type: multipart/mixed; boundary="===============8777466146847277998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.3 FAILED
Message-ID: <0101018f34e297eb-fb60cd8e-0560-458a-8238-894cc85c0ebc-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198862

--===============8777466146847277998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.24.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.11-1.24.3.patch
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
From 218c97f34a2068ba7dd84efeeef3b81870e0bf64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 13:40:00 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.22.11 -> 1.24.3

---
 ...treamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.24.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
index f3287efa96..d468f2983c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b13dcc9332ef27a7c1e7005c0196883874f91622f8aa6e52f218b05b15d2bf5"
+SRC_URI[sha256sum] = "d9c5b152468a45c1fa8351410422090a7192707ad74d2e1a4367f5254e188d91"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.0


--===============8777466146847277998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.11-1.24.3.patch"

RnJvbSAyMThjOTdmMzRhMjA2OGJhN2RkODRlZmVlZWYzYjgxODcwZTBiZjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMzo0MDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIyLjExIC0+IDEuMjQuMwoKLS0tCiAuLi50cmVh
bWVyMS4wLWxpYmF2XzEuMjIuMTEuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1saWJhdl8xLjI0LjMuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1s
aWJhdl8xLjIyLjExLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdl8xLjI0LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjIy
LjExLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjQuMy5iYgppbmRleCBmMzI4N2VmYTk2Li5kNDY4ZjI5ODNjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjI0LjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjkzMzNkYWEwNDRjYjc3ZTQ4NmNjMzYxMjlmN2E3
NzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFt
ZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YjEzZGNjOTMzMmVmMjdhN2MxZTcwMDVjMDE5Njg4Mzg3
NGY5MTYyMmY4YWE2ZTUyZjIxOGIwNWIxNWQyYmY1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ5
YzViMTUyNDY4YTQ1YzFmYTgzNTE0MTA0MjIwOTBhNzE5MjcwN2FkNzRkMmUxYTQzNjdmNTI1NGUx
ODhkOTEiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============8777466146847277998==
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
DISTRO_VERSION       = "5.0+snapshot-209ce5f689eb1a7173ea66cecd39764b974b9be1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:209ce5f689eb1a7173ea66cecd39764b974b9be1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 357 Local 345 Mirrors 0 Missed 12 Current 564 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2301 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_recipe_qa)
NOTE: Running task 2409 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2534 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_fetch: Succeeded
NOTE: Running task 2535 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_unpack)
NOTE: Running task 2536 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 2537 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_patch)
NOTE: Running task 2538 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 2539 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2540 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2541 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-
 devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'ffmpeg', 'gstreamer
 1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled ...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/gst-libav-1.24.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/build
| Build type: cross build
| Project name: gst-libav
| Project version: 1.24.3
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libavfilter found: YES 9.12.100
| Run-time dependency libavformat found: YES 60.16.100
| Run-time dependency libavcodec found: YES 60.31.102
| Run-time dependency libavutil found: YES 58.29.100
| Checking if "libav is provided by FFmpeg" with dependencies libavfilter, libavformat, libavcodec, libavutil compiles: YES
| Has header "unistd.h" : YES
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-libav-1.24.3/meson.build:91:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844, line 170
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844, line 159
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844, line 183
NOTE: recipe gstreamer1.0-libav-1.24.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2541 tasks of which 2531 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501133923.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501133923.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-libav-1.24.3-r0 do_configure: meson failed
ERROR: gstreamer1.0-libav-1.24.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/run.do_configure.3547844', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.24.3/temp/log.do_configure.3547844
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb:do_configure) failed with exit code '1'

--===============8777466146847277998==--

