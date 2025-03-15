Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F8AC369C2
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10337.1742048299938570352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QlJYdKYK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hYty1ibH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2bcb23-2c48e749-6453-4b59-8b45-f97a7ce05bf6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZN06RQCu1C1ZupH+TzEIFNgbROgE/FItaDHuWzHa+Fo=;
	b=QlJYdKYKAiUOWxecXKNcL41UqvJKjNqXBBzl3BTBfvf+jKDvX4l7SyBtmAZWqyjk
	Nd1JJicGuLAzwM3UlG15p3tLXaYcd7isCHICnrZhSEqtWWlE7oalUXCVCVUqkmkjygI
	aortlMg73qpuSG/ScJF8PCw3JgwqdXEZvNEuylts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZN06RQCu1C1ZupH+TzEIFNgbROgE/FItaDHuWzHa+Fo=;
	b=hYty1ibHZz0jd8MsciqI3hrtilnq3XcquqlgcwJHULRYbwbY8e5zm2qBjWBW7701
	8UT2pNuvrXMMP9Z99Jp7U0MexXzRYfeTJBlaJpb6YLc8nXRbGg76imG32ey1prUUI8F
	sZ9/DwOiVQTLE5mM+xqSQ7Y/62bfP/j7d72ep3Io=
Content-Type: multipart/mixed; boundary="===============4895280908120040253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.26.0 FAILED
Message-ID: <010101959a2bcb23-2c48e749-6453-4b59-8b45-f97a7ce05bf6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212967

--===============4895280908120040253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.26.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.12-1.26.0.patch
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
From ff5e8d34080a2d4db2e12b6b5582e5d73ba0cf43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:38:12 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.12 -> 1.26.0

---
 ...eamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
index f62cb159c2..67f372f11f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
+SRC_URI[sha256sum] = "e5046a05d77abb15671ad01cd1908d17d62e5a06f5d7841be4342ade2a3fb8db"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.1


--===============4895280908120040253==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.12-1.26.0.patch"

RnJvbSBmZjVlOGQzNDA4MGEyZDRkYjJlMTJiNmI1NTgyZTVkNzNiYTBjZjQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6Mzg6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjQuMTIgLT4gMS4yNi4wCgotLS0KIC4uLmVh
bWVyMS4wLXB5dGhvbl8xLjI0LjEyLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXB5
dGhvbl8xLjI0LjEyLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNi4wLmJifSAoOTElKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcHl0aG9uXzEuMjQuMTIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yNC4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNi4wLmJiCmluZGV4IGY2MmNiMTU5YzIuLjY3ZjM3MmYx
MWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcHl0aG9uXzEuMjQuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25fMS4yNi4wLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNF
TlNFID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9
LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNjc5ZTJjYTNlNjU1YTczMjg2
MjdjNDY3MGMzMjRmYzIyZjU4OGQyY2I4ZWNkMmZhN2E2YTQyZGY1MTEzMmNjIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImU1MDQ2YTA1ZDc3YWJiMTU2NzFhZDAxY2QxOTA4ZDE3ZDYyZTVhMDZmNWQ3
ODQxYmU0MzQyYWRlMmEzZmI4ZGIiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAi
Z3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3Qi
Ci0tIAoyLjQ0LjEKCg==

--===============4895280908120040253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8d0c601c594575f9a06271fe176bd721c20d0415"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 500 Local 488 Mirrors 0 Missed 12 Current 666 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2570 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_recipe_qa: Started
NOTE: Running task 2830 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3111 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 3180 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_unpack)
NOTE: Running task 3181 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 3182 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_patch)
NOTE: Running task 3183 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 3184 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3185 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3186 of 3198 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstr
 eamer1.0_1.24.12.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-pycairo', 'python3-pygobject', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'lin
 ux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Dplugin=enabled -Dlibpython-dir=/usr/lib ...
| The Meson build system
| Version: 1.7.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/gst-python-1.26.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/build
| Build type: cross build
| Project name: gst-python
| Project version: 1.26.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/recipe-sysroot ld.bfd 2.44
| C compiler for the build machine: gcc (gcc 13.3.0 "gcc (GCC) 13.3.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240716
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO. Found 1.24.12 but need: '>= 1.26.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-python-1.26.0/meson.build:19:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489, line 183
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489, line 154
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489, line 196
NOTE: recipe gstreamer1.0-python-1.26.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3186 tasks of which 3176 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133755.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133755.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/log.do_configure.1350489
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.26.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-python-1.26.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/run.do_configure.1350489' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.0/temp/log.do_configure.1350489
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb:do_configure) failed with exit code '1'

--===============4895280908120040253==--

