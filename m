Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9959C64ED9
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.30014.1675272856393680297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DCti+rp/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b31d5-3c8268ec-4c48-4026-aa81-9b4312d173cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+aSPkR7jsdkDks3XzwttGhOQHKp7L6EsSc05U72/ny0=;
	b=DCti+rp/MHBysq+n8bQjBfo+HpQ3TNvj3SwN/COUpB+lOHK/L9hQKQ6T+Vait2jA
	+1STy+ssCyRZUF1B105HJ8BOV0g97LnB69s4xiywRSO2D/2gkZp2k3eVGZY3iA1ygac
	BJ8sZU+++Ftia7XXf2F/k+AqOzBRj+pKqduS9Dbs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+aSPkR7jsdkDks3XzwttGhOQHKp7L6EsSc05U72/ny0=;
	b=V5HH0IHsgALIL+50CYJTbXgl1zpYkkJRjpzYC2ANRHVtKqAZDOcdH8+9ePWHgt1H
	QvHOMjRveVTjzBCAn+YtLm8P3MDArqNsi2BfFsl5GlWpwNQgzhIcCG96HP0yXeNFyTd
	RnZMdyMgjA0hfMvr790G/HQS535XkSnPFdGyc+6Q=
Content-Type: multipart/mixed; boundary="===============8403441848457931158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b31d5-3c8268ec-4c48-4026-aa81-9b4312d173cd-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176645

--===============8403441848457931158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.5-1.22.0.patch
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
--===============8403441848457931158==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.5-1.22.0.patch"

RnJvbSBlMjhkNDEzNTkzYTgzNjEzMWViOWYxMTA2ZDg4Njk1YmRhNDkwZjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjozNzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIwLjUgLT4gMS4yMi4wCgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4wLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIwLjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMi4wLmJiCmluZGV4IDcxNmY1MGViZTEuLjkxMjg4OWFkNTQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTEwYzZmYjRmZjNmNjc2ZDc5NDZjZTE4MDBlMDRjY2Y1YWFiZTVhNTg2ZDRlMTY0ZDE5NjE4MDhm
YWI4Yzk0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1OTNjY2FkMTlmODhlNWZhMjlmNDBmOTgz
NTZjMDA3ODA2YmQ1MzU4Mjg3MDdiMTQwNjk0NGQxNmE5MGJkZmY1IgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjM3LjMK
Cg==

--===============8403441848457931158==
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
meta-yocto-bsp       = "tmp-auh-upgrades:412b74e3b1095649b5a7656774efc72c1677ba85"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 179 Mirrors 0 Missed 7 Current 510 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2331 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_fetch)
NOTE: Running task 2432 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2444 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_unpack)
NOTE: Running task 2445 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2446 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2447 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2448 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2449 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo
 rker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/ho
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/rec
 ipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libva', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxrandr', 'libxrender', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'wayland-native', 'attr-native', 'libtool-native', 'libffi-native', 'libxml2-native', 'expat-native', 'util-macros', 'xtrans', 'libxcb', 'xorgproto', 'autoconf-archive', 'libxext', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-build-native', 'gettext-minimal-native', 'glib-2.0-native', 'zlib-native', 'expat', 'libffi', 'libxml2', 'libxfixes', 'shadow-native', 'initscripts', 'libseccomp', 'update-rc.d', 'bash-completion', 'libxkbcommon', 'base-passwd', 'shadow-sysroot', 'shadow', 'zstd', 'kmod', 'opkg-utils', 'libpam', 'acl', 'util-
 linux', 'libcap', 'base-files', 'binutils-cross-i686', 'libmpc-native', 'linux-libc-headers', 'gmp-native', 'texinfo-dummy-native', 'zstd-native', 'mpfr-native', 'flex-native', 'gnu-config-native', 'libgcc', 'libpthread-stubs', 'libpciaccess', 'libwebp', 'gobject-introspection', 'cairo', 'libusb1', 'orc', 'librsvg', 'bluez5', 'vulkan-loader', 'openssl', 'sbc', 'libsndfile1', 'libgudev', 'bzip2', 'pango', 'curl', 'xrandr', 'vulkan-headers', 'libxdamage', 'libxxf86vm', 'libxshmfence', 'zlib', 'libjpeg-turbo', 'alsa-lib', 'libogg', 'libsm', 'libtheora', 'libvorbis', 'iso-codes', 'libpng', 'libxv', 'glib-2.0', 're2c-native', 'libnsl2-native', 'libtirpc-native', 'ncurses-native', 'util-linux-libuuid-native', 'sqlite3-native', 'bzip2-native', 'readline-native', 'gdbm-native', 'openssl-native', 'cmake-native', 'xcb-proto', 'libxdmcp', 'libxau', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'util-linux-native', 'gettext-native', 'libpcre2-native',
  'python3', 'xkeyboard-config', 'libxcrypt', 'attr', 'xz', 'cracklib', 'flex', 'util-linux-libuuid', 'ncurses', 'libcap-ng', 'm4-native', 'fontconfig', 'pixman', 'vala', 'libstd-rs', 'gdk-pixbuf', 'dbus', 'libical', 'readline', 'flac', 'libxft', 'freetype', 'harfbuzz', 'fribidi', 'libidn2', 'libice', 'libpcre2', 'perl-native', 'unzip-native', 'libcap-ng-native', 'libnsl2', 'sqlite3', 'libtirpc', 'gdbm', 'shared-mime-info', 'icu', 'libunistring', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddoc=disabled -Dexamples=disabled -Dtests=enabled -Dwith_drm=yes -Dwith_egl=no -Dwith_encoders=yes -Dwith_glx=yes -Dwith_wayland=yes -Dwith_x11=yes...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/gstreamer-vaapi-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/build
| Build type: cross build
| 
| ../gstreamer-vaapi-1.22.0/meson.build:1:0: ERROR: Unknown options: "with_drm, with_egl, with_encoders, with_glx, with_wayland, with_x11"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415, line 186
NOTE: recipe gstreamer1.0-vaapi-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2449 tasks of which 2441 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-vaapi-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-vaapi-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/run.do_configure.3143415', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.0-r0/temp/log.do_configure.3143415
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb:do_configure) failed with exit code '1'

--===============8403441848457931158==--

