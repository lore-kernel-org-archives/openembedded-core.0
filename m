Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16D9C54F2B
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1250.1710522012666851723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K5EVex3+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NlmkTFcb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e430ea01f-0a9a5234-0dc1-45ae-a14e-9d5523ea2fe2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VwPzM/U1HOHTN+V5iJdwaQgN6KvBD9OuGEalnq8yXxs=;
	b=K5EVex3+zhSRgGGp8DYFxM9wyzIlOsOFciurUeIcLlMvb/5TJjEyf81YNZVeulLu
	m6Q0uyJhr5B4E4YHfvMMOWrrlpyKVLcHUd9S3k+NXx8PBQ/9jPWTu7x1FWCzDmIqlXf
	gO+aWD2DXWJrWRIp0NwZajOdwEvPTu2BOtUq6Cw0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VwPzM/U1HOHTN+V5iJdwaQgN6KvBD9OuGEalnq8yXxs=;
	b=NlmkTFcbaFtvvWEQrmO5xvmZ4MOWSs046edEFwxwOV6Ud6ihpQjeTP6nfsZXWje/
	n0R4/gKD1+aOmLA0C07eBIAz9cVgR4eznV8dT8R0wvufhJHNa+qjKIxOA7L0b+5ygKE
	h7t7EUCUp3S899TJOSLm+UrBhtKVqI9MhuurokFU=
Content-Type: multipart/mixed; boundary="===============6174102714740131500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.0 FAILED
Message-ID: <0101018e430ea01f-0a9a5234-0dc1-45ae-a14e-9d5523ea2fe2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197227

--===============6174102714740131500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.24.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.22.10-1.24.0.patch
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
From 0496b73716e70d9340008ea1afb1246ad1acd304 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 14:46:22 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.22.10 -> 1.24.0

---
 ...eamer1.0-python_1.22.10.bb => gstreamer1.0-python_1.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.10.bb => gstreamer1.0-python_1.24.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb
index b829a0fc62..545bb21ce5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "99e37ea9f7163099734f9b0fce361bc67a0e7a65ffba9bc497127506a3fdedb3"
+SRC_URI[sha256sum] = "041c2255c1ea9936c777dcb08a36ecaa6a24a69a12fc46ef53f1530d46c59f9d"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.42.0


--===============6174102714740131500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.22.10-1.24.0.patch"

RnJvbSAwNDk2YjczNzE2ZTcwZDkzNDAwMDhlYTFhZmIxMjQ2YWQxYWNkMzA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTQ6NDY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjIuMTAgLT4gMS4yNC4wCgotLS0KIC4uLmVh
bWVyMS4wLXB5dGhvbl8xLjIyLjEwLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXB5
dGhvbl8xLjIyLjEwLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNC4wLmJifSAoOTElKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcHl0aG9uXzEuMjIuMTAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yMi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC4wLmJiCmluZGV4IGI4MjlhMGZjNjIuLjU0NWJiMjFj
ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcHl0aG9uXzEuMjIuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC4wLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNF
TlNFID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9
LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5OWUzN2VhOWY3MTYzMDk5NzM0
ZjliMGZjZTM2MWJjNjdhMGU3YTY1ZmZiYTliYzQ5NzEyNzUwNmEzZmRlZGIzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjA0MWMyMjU1YzFlYTk5MzZjNzc3ZGNiMDhhMzZlY2FhNmEyNGE2OWExMmZj
NDZlZjUzZjE1MzBkNDZjNTlmOWQiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAi
Z3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3Qi
Ci0tIAoyLjQyLjAKCg==

--===============6174102714740131500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-67d5510a3b0af6f226cf4d81844426a4b5ab615c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:67d5510a3b0af6f226cf4d81844426a4b5ab615c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 463 Local 451 Mirrors 0 Missed 12 Current 699 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2574 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_recipe_qa)
NOTE: Running task 2810 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3177 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 3178 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_unpack)
NOTE: Running task 3179 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 3180 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_patch)
NOTE: Running task 3181 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 3182 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3183 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3184 of 3196 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstre
 amer/gstreamer1.0_1.22.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-pycairo', 'python3-pygobject', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-he
 aders', 'alsa-lib', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 's
 qlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Dplugin=enabled -Dlibpython-dir=/usr/lib ...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/gst-python-1.24.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/build
| Build type: cross build
| Project name: gst-python
| Project version: 1.24.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.10 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-python-1.24.0/meson.build:20:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342, line 182
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342, line 195
NOTE: recipe gstreamer1.0-python-1.24.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3184 tasks of which 3174 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315144550.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315144550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.24.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-python-1.24.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/run.do_configure.4178342', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.24.0/temp/log.do_configure.4178342
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.0.bb:do_configure) failed with exit code '1'

--===============6174102714740131500==--

