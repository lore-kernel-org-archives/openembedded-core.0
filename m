Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2CAC77B70
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30017.1675272857126769122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TPTIJ36B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b306e-b2f4f6bd-615b-4834-9528-6328da03080a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QIKDeAFKeu7dG3tjkg1Q+R4hoXQGZiYDaIk1/tf5FRs=;
	b=TPTIJ36B2q31OjXVIOechb8yCB/W83joDtE6MKmLm3N4N4yoRLXdzDX3RvziNp++
	44tXDWkO4d47qm9Rvx6h9KfABHuwa6fW8Qn9yFW4eOjvrv0RD54AuWMo5t+qb/oqDI/
	SvsxK6q0JLsetY0ntl8WRhBdVo8JWbLOTL5mWSKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QIKDeAFKeu7dG3tjkg1Q+R4hoXQGZiYDaIk1/tf5FRs=;
	b=MTx2tj/Fk2/6+3S5sw9XQ2HqJNo0WMHy+IhX5pAd2mSBKv9S94iME51q09vShBun
	r10VSx2JZGmW5OBYGGxoo7IxjJuAj+t8f3fn/5NeSCSbCsOQ+UD+K0VlVEEgNqMTNlv
	a6ZnKH4UTxTv/6HMFQhjgfUUzI86c2Ola3lfzw2Q=
Content-Type: multipart/mixed; boundary="===============0870250777056402401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b306e-b2f4f6bd-615b-4834-9528-6328da03080a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176648

--===============0870250777056402401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.20.5-1.22.0.patch
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
--===============0870250777056402401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.20.5-1.22.0.patch"

RnJvbSBiZTMyYWQ0NzkxNDFkNjIzNzI2N2U3MGI3NWRmYTJiNDg4NTA5ZDhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjozNTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yMC41IC0+IDEuMjIuMAoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yMC41LmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yMi4wLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjAuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjIwLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMC5iYgppbmRleCAwNWU5YWNlMjc2Li5iNjc4MmE4NDJkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIwLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yMi4wLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNzQ4NzY1MjMxODY1OWNmZDdkYzQyNzg0
YjcxM2M3OGQyOWNjN2E3ZGY0ZmIzOTcxMzRjOGMxMjVmNjVlM2IyIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjZjNjNhZDM2NGNhNDYxN2ViMmNiYjM5NzVhYjI2YzY2NzYwZWIzYzdhNmFkZjViZTY5
Zjk5YzExZTIxZWYzYTUiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAiZ3N0cmVh
bWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCi0tIAoy
LjM3LjMKCg==

--===============0870250777056402401==
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
meta-yocto-bsp       = "tmp-auh-upgrades:934bece309920702f9461dabd9c03eafff4d77c3"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 188 Local 181 Mirrors 0 Missed 7 Current 443 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1803 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_fetch)
NOTE: Running task 1964 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2187 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_unpack)
NOTE: Running task 2188 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2191 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2192 of 2200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:d
 o_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wor
 ker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'python3-pygobject', 'python3', 'qemu-native', 'quilt-native', 'gobject-introspection', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'libtool-native', 'python3-pycairo', 'cairo', 'glib-2.0', 'glib-2.0-native', 'zlib-native', 'libxml2', 'zlib', 'orc', 'iso-codes', 'libxrender', 'libpng', 'libvorbis', 'mesa', 'wayland', 'libdrm', 'libsm', 'libjpeg-turbo', 'libxv', 'libx11', 'libogg', 'wayland-protocols', 'util-linux', 'alsa-lib', 'pango', 'libtheora', 'linux-libc-headers', 'mpfr-native', 'binutils-cross-i686', 'gmp-native', 'flex-native', 'gnu-config-native', 'texinfo-dummy-native', 'zstd-native', 'libmpc-native', 'sqlite3', 'bzip2', 'opkg-utils', 'ncurses', 'libnsl2', 'libtirpc', 'libffi', 'xz', 'gdbm', 'openssl', 'util-linux-libuuid', 'readline', 'li
 bxcrypt', 'openssl-native', 'gdbm-native', 'readline-native', 'sqlite3-native', 'ncurses-native', 'libnsl2-native', 'util-linux-libuuid-native', 'libffi-native', 'libtirpc-native', 'bzip2-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-wheel-native', 'python3-build-native', 'attr-native', 'autoconf-archive', 're2c-native', 'gettext-minimal-native', 'libgcc', 'pixman', 'fontconfig', 'libxext', 'libxcb', 'bash-completion', 'libpcre2', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'xorgproto', 'util-macros', 'vulkan-loader', 'libxfixes', 'expat', 'libxxf86vm', 'libxshmfence', 'vulkan-headers', 'xrandr', 'libxdamage', 'libpciaccess', 'libpthread-stubs', 'xtrans', 'libice', 'libcap-ng', 'libpam', 'libxft', 'freetype', 'fribidi', 'harfbuzz', 'm4-native', 'perl-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'xcb-proto', 'libxdmcp', 'libxau', 'libcap-ng-native', 'libxrandr', 'flex', 'cracklib', 'icu',
  'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Dplugin=enabled -Dlibpython-dir=/usr/lib ...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/gst-python-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/build
| Build type: cross build
| Project name: gst-python
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-python-1.22.0/meson.build:18:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115:190 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115, line 190
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115, line 158
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115, line 203
NOTE: recipe gstreamer1.0-python-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2192 tasks of which 2184 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-python-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/run.do_configure.2905115', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-python/1.22.0-r0/temp/log.do_configure.2905115
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb:do_configure) failed with exit code '1'

--===============0870250777056402401==--

