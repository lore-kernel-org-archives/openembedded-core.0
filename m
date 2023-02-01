Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199B9C6FA9E
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.30366.1675272858876001139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ky+s3oFm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b2a7c-c1df0a9c-80d2-4911-91d4-c3a5fa6d196c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5YJRj24Ex9HqqG/FDuEIACdmPkfeKZ80eR224CHgsIY=;
	b=ky+s3oFmcMwySwHFo5MMZCbZ1HgDPYvJvk6VISHvB2TJm+YoHeZZib9xjuFfAM0f
	tqxZDBoGE7ciWjlHZ+FoRVE308s7TqJRkTwcmGT8b3VrN8p0/c1ihYU9k0lMlEc5iq4
	KvxNrVV+aCVh52utI6Wcc21gN8fbcBy/pPhFI6xg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5YJRj24Ex9HqqG/FDuEIACdmPkfeKZ80eR224CHgsIY=;
	b=NPZLxBzmlM96B4jTpcIp6GBew8ixHIjNOJ+LnP2LdWUgCiJaL73WDTuiLJ+tAhXX
	ccJ9/D7IiP0p2sJ8Ke6UyCePsZaOfxbvMNlvmUqXOmb589Srrbi4F/Ta2LNwCcri6kj
	pvsSVdX/YG/dF6aFsb5ZeqkjpDVuHkQ/HAGAKAX0=
Content-Type: multipart/mixed; boundary="===============3797541488041388619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-bad: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b2a7c-c1df0a9c-80d2-4911-91d4-c3a5fa6d196c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176639

--===============3797541488041388619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-bad* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-bad-upgrade-1.20.5-1.22.0.patch
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
--===============3797541488041388619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-bad-upgrade-1.20.5-1.22.0.patch"

RnJvbSBmMTRjNjk2MWQ4NTAxOGRmZDkxZDg5MzBiMjYyNGQ1MTJkZjdmZTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjoyNToxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZDogdXBncmFkZSAxLjIwLjUgLT4gMS4yMi4wCgotLS0KIC4u
LnBsdWdpbnMtYmFkXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yMi4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yMi4w
LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yMC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjIyLjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjIwLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yMi4w
LmJiCmluZGV4IDJmMTc5M2QxY2UuLmI5ZmMxN2YzZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yMC41LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWRfMS4yMi4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9n
c3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMt
YmFkCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRp
cmVjdGx5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlz
c2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBcCiAgICAgICAgICAgICIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNDMxMjE0YjA3NTRkNzAzN2FkY2RlOTNjMzE5NTEwNjE5
NjU4ODk3M2U1YjMyZGNiMjQ5Mzg4MDVmODY2MzYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNj
OWQ5MzAwZjVmNGZiM2UzZDM2MDA5Mzc5ZDFmYjZkOWVjZDc5YzFhMTM1ZGY3NDJiOGE2ODQxN2Rk
NjYzYTEiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1iYWQtJHtQVn0iCiAKLS0gCjIu
MzcuMwoK

--===============3797541488041388619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ee5503e31ccfe7b7e93c7adab2f62d604a18e1aa"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 180 Local 173 Mirrors 0 Missed 7 Current 508 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2268 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2395 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-
 worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/pok
 y/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot', '/home/pokybuild/yoc
 to-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/po
 kybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/re
 cipes-graphics/shaderc/shaderc_2022.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'glibc', 'libxml2', 'gcc-cross-i686', 'gcc-runtime', 'orc', 'qemu-native', 'quilt-native', 'bzip2', 'gobject-introspection', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'pango', 'vulkan-loader', 'wayland-protocols', 'wayland', 'libxcb', 'libxkbcommon', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libsndfile1', 'sbc', 'libwebp', 'curl', 'libusb1', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'shaderc-native', 'wayland-native', 'libxrender', 'alsa-lib', 'libjpeg-turbo', 'libxv', 'mesa', 'libogg', 'zlib', 'libx11', 'libtheora', 'libpng', 'util-linux', 'libsm', 'iso-codes', 'libvorbis', 'linux-libc-headers', 'zlib-native', 'systemd', 'opkg-utils', 'glib-2.0', 'libxext', 'pixman', 'fontconfig', 'expat-native', 'libxml2-native', 'libffi-native', 'flac', 'python3', 'libxau
 ', 'libpthread-stubs', 'xorgproto', 'xcb-proto', 'libxdmcp', 'readline', 'dbus', 'initscripts', 'update-rc.d', 'libical', 'libtool-native', 'gettext-minimal-native', 'vulkan-headers', 'libxrandr', 'libidn2', 'gmp-native', 'gnu-config-native', 'flex-native', 'mpfr-native', 'binutils-cross-i686', 'zstd-native', 'texinfo-dummy-native', 'libmpc-native', 'xkeyboard-config', 'gdk-pixbuf', 'libstd-rs', 'vala', 'libffi', 'autoconf-archive', 'util-linux-native', 'libpcre2-native', 'libpciaccess', 're2c-native', 'attr-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'gdbm-native', 'libnsl2-native', 'readline-native', 'bzip2-native', 'libtirpc-native', 'util-linux-libuuid-native', 'ncurses-native', 'sqlite3-native', 'openssl-native', 'libgcc', 'harfbuzz', 'freetype', 'libxft', 'fribidi', 'spirv-tools-native', 'glslang-native', 'cmake-native', 'spirv-headers-native', 'expat', 'util-macros', 'libxxf86vm', 'libxfixes', 'libxdamage',
  'xrandr', 'libxshmfence', 'xtrans', 'libpam', 'libcap-ng', 'libxcrypt', 'util-linux-libuuid', 'bash-completion', 'ncurses', 'libice', 'libseccomp', 'base-passwd', 'shadow', 'shadow-sysroot', 'acl', 'libcap', 'kmod', 'zstd', 'base-files', 'shadow-native', 'libpcre2', 'libnsl2', 'gdbm', 'xz', 'sqlite3', 'libtirpc', 'icu', 'libunistring', 'm4-native', 'shared-mime-info', 'libcap-ng-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'perl-native', 'flex', 'cracklib', 'attr', 'unzip-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Dgpl=disabled -Ddoc=disabled -Daes=enabled -Dcodecalpha=enabled -Ddecklink=enabled -Ddvb=enabled -Dfbdev=enabled -Dipcpipeline=enabled -Dshm=enabled -Dtranscode=enabled -Dandroidmedia=disabled -Dapplemedia=disabled -Dasio=disabled -Dbs2b=disabled -Dchromaprint=disabled -Dd3dvideosink=disabled -Dd3d11=disabled -Ddirectsound=disabled -Ddts=disabled -Dfdkaac=disabled -Dflite=disabled -Dgme=disabled -Dgs=disabled -Dgsm=disabled -Diqa=disabled -Dkate=disabled -Dladspa=disabled -Dldac=disabled -Dlv2=disabled -Dmagicleap=disabled -Dmediafoundation=disabled -Dmicrodns=disabled -Dmpeg2enc=disabled -Dmplex=disabled -Dmusepack=disabled -Dnvcodec=disabled -Dopenexr=disabled -Dopenni2=disabled -Dopenaptx=disabled -Dopensles=disabled -Donnx=disabled -Dqroverlay=disabled -Dsoundtouch=disabled -Dspandsp=disabled -Dsvthevcenc=disabled -Dteletext=disabled -Dwasapi=disabled -Dwasapi2=disabled -Dwildmidi=disabled -Dwinks=
 disabled -Dwinscreencap=disabled -Dwpe=disabled -Dzxing=disabled -Daom=disabled -Dassrender=disabled -Davtp=disabled -Dbluez=enabled -Dbz2=enabled -Dclosedcaption=enabled -Dcurl=enabled -Ddash=enabled -Ddc1394=disabled -Ddirectfb=disabled -Ddtls=enabled -Dfaac=disabled -Dfaad=disabled -Dfluidsynth=disabled -Dgl=enabled -Dhls=enabled -Dkms=disabled -Dcolormanagement=disabled -Dlibde265=disabled -Dcurl-ssh2=disabled -Dmodplug=disabled -Dmsdk=disabled -Dneon=disabled -Dopenal=disabled -Dopencv=disabled -Dopenh264=disabled -Dopenjpeg=disabled -Dopenmpt=disabled -Dhls-crypto=openssl -Dopus=disabled -Dorc=enabled -Dresindvd=disabled -Drsvg=enabled -Drtmp=disabled -Dsbc=enabled -Dsctp=disabled -Dsmoothstreaming=enabled -Dsndfile=enabled -Dsrt=disabled -Dsrtp=disabled -Dtinyalsa=disabled -Dttml=enabled -Duvch264=enabled -Dv4l2codecs=disabled -Dva=disabled -Dvoaacenc=disabled -Dvoamrwbenc=disabled -Dvulkan=enabled -Dwayland=enabled -Dwebp=enabled -Dwebrtc=disabled -Dwebrtcdsp=disabled -Dx11=
 enabled -Dx265=disabled -Dzbar=disabled...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/gst-plugins-bad-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/build
| Build type: cross build
| Project name: gst-plugins-bad
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-g++ (GCC) 12.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| C++ compiler for the build machine: g++ (gcc 12.2.0 "g++ (GCC) 12.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C++ supports arguments -Wno-non-virtual-dtor: YES
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C++ supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C++ supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "fcntl.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/ip.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "pthread.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/param.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/time.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/utsname.h" : YES
| Has header "unistd.h" : YES
| Has header "windows.h" : NO
| Has header "winsock2.h" : NO
| Has header "ws2tcpip.h" : NO
| Checking for function "dcgettext" : YES
| Checking for function "getpagesize" : YES
| Checking for function "gmtime_r" : YES
| Checking for function "memfd_create" : YES
| Checking for function "mmap" : YES
| Checking for function "pipe2" : YES
| Checking for function "getrusage" : YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-bad-1.22.0/meson.build:295:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212, line 180
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212, line 169
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212, line 193
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2425 tasks of which 2417 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-bad-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/run.do_configure.1581212', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.22.0-r0/temp/log.do_configure.1581212
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure) failed with exit code '1'

--===============3797541488041388619==--

