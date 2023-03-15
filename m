Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A91EC7619A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12162.1678895728779058360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dH4gYhrz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbc53b-8760b858-0b8b-42b1-97e6-2a7f52c1fa7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fmdRGVbtdRDFTMohJlFeTS3w0pPzfUOznTMw6S2YVCk=;
	b=dH4gYhrzs74keF4+T/griRIao1ihgToxnHRSmspMcJFmFKmkfBKFRzQwEsGTlcCT
	SfsT8EQuPY0a6wDACVXi/LGPLzXpgwVuU1DdSwRmoV7Vj0KO/wBjicL2AhNT2h419Lk
	B2tbDebI1jkb0/faYlEvwhYqtplxXsr5NoTUEU3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fmdRGVbtdRDFTMohJlFeTS3w0pPzfUOznTMw6S2YVCk=;
	b=IBJIvND9z7VhoUwxEQHPt04InftVRHV7h/pICEnYM5Flv6P/ysWB4QPxzqF4jNQu
	Dr2LO3vXQrrT9BiLxZSPlut/IiKODRepjnT2pRH4YpU6oceI+5L33Ldq9mTV5BClWRu
	blLaLUgOg1Jn8w2+tYv4f1L+2aRYoXh187fVK9oY=
Content-Type: multipart/mixed; boundary="===============4035390736164815941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.1 FAILED
Message-ID: <01010186e5fbc53b-8760b858-0b8b-42b1-97e6-2a7f52c1fa7c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178640

--===============4035390736164815941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.1.patch
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
--===============4035390736164815941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.1.patch"

RnJvbSA2OTUzZmZlN2EyNzQ2MzBiMmI4NWM4N2MxZTRlYzRiZmJlZGM0OWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTQ6MzU6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuMS5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjIuMS5iYgppbmRleCA4YTcwM2Y1MzNlLi45N2JmOTM0ODIxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjU5M2NjYWQxOWY4OGU1ZmEyOWY0MGY5ODM1NmMwMDc4MDZiZDUzNTgyODcwN2IxNDA2OTQ0ZDE2
YTkwYmRmZjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDIzYjU3ZGI3ZmM1ZjkxMzdkYWRmMTdj
YjM4NTNhNDc0MzhkNjNjZDRiYTY4ODlhODgyZTYzZmI1YmU5OTdiYyIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi4zOS4y
Cgo=

--===============4035390736164815941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-958bb91d3914ab6267df66c7dbc258dcfc7838a2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:958bb91d3914ab6267df66c7dbc258dcfc7838a2"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 234 Local 227 Mirrors 0 Missed 7 Current 458 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2317 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_fetch)
NOTE: Running task 2418 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_unpack)
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo
 rker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot', '/ho
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/rec
 ipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libva', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxrandr', 'libxrender', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'wayland-native', 'libgcc', 'linux-libc-headers', 'glib-2.0-native', 'zlib-native', 'util-macros', 'xorgproto', 'libxext', 'xtrans', 'libxcb', 'autoconf-archive', 'libxfixes', 'gobject-introspection', 'libxml2', 'glib-2.0', 'base-passwd', 'libxkbcommon', 'update-rc.d', 'zstd', 'shadow-sysroot', 'kmod', 'bash-completion', 'opkg-utils', 'shadow', 'acl', 'base-files', 'util-linux', 'libcap', 'initscripts', 'libpam', 'libseccomp', 'shadow-native', 're2c-native', 'expat', 'vulkan-loader', 'libxxf86vm', 'libxshmfence', 'xrandr', 'zlib', 'vulkan-headers', 'libxdamage', 'ncurses-nat
 ive', 'libtool-native', 'libnsl2-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'libffi-native', 'gdbm-native', 'openssl-native', 'util-linux-libuuid-native', 'libtirpc-native', 'attr-native', 'expat-native', 'libxml2-native', 'libpng', 'libvorbis', 'alsa-lib', 'libxv', 'libjpeg-turbo', 'libogg', 'libsm', 'pango', 'orc', 'libtheora', 'iso-codes', 'gettext-minimal-native', 'libsndfile1', 'librsvg', 'libwebp', 'libusb1', 'bzip2', 'libgudev', 'cairo', 'bluez5', 'curl', 'openssl', 'sbc', 'libpciaccess', 'libpthread-stubs', 'libffi', 'python3-installer-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'texinfo-dummy-native', 'gmp-native', 'flex-native', 'binutils-cross-i686', 'gnu-config-native', 'zstd-native', 'mpfr-native', 'libmpc-native', 'libpcre2-native', 'util-linux-native', 'gettext-native', 'libxdmcp', 'libxau', 'xcb-proto', 'python3', 'libpcre2', 'xkeyboard-config', 'xz', 'attr', 'libxcrypt', 'libcap-ng', 'ncurses', 'util-linux
 -libuuid', 'cracklib', 'perl-native', 'cmake-native', 'libice', 'harfbuzz', 'fribidi', 'fontconfig', 'libxft', 'freetype', 'flac', 'libstd-rs', 'vala', 'gdk-pixbuf', 'pixman', 'dbus', 'libical', 'readline', 'libidn2', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'm4-native', 'libcap-ng-native', 'gdbm', 'sqlite3', 'libtirpc', 'libnsl2', 'make-native', 'icu', 'shared-mime-info', 'libunistring', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing gst/vaapi/libgstvaapi.so to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image/usr/lib/gstreamer-1.0
| mv: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.119409:154 exit 1 from 'mv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/pkgconfig'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.119409, line 154
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.119409, line 164
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 2437 tasks of which 2427 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-vaapi-1.22.1-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.119409', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/log.do_install.119409
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install) failed with exit code '1'

--===============4035390736164815941==--

