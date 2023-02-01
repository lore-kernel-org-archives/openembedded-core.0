Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268F0C6FD19
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29999.1675272853476625518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=By3Sam4B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b2973-e9b7e255-73fb-4b19-a7dc-466698fd4dc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=669teoOjfbBobnH7UTc805W9bfJP+fwlg8ZTl02Q04E=;
	b=By3Sam4BwLPAxJnY6CxkUrso0tG0lyhlpszgCXqFDIB8Un1VCYF7wGw+5Mp65DJr
	D0B57Id0ZuI4pp1h1uVdp++JQE4gdq/3gm58cstvGQNVIKI4yZnPgR7Mpe0zm/xjroN
	XMia5A2R4FZ7Z93gr+DN2n8m0HiY9B/jjhg6Iid0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=669teoOjfbBobnH7UTc805W9bfJP+fwlg8ZTl02Q04E=;
	b=Q4rc51alK1kASDtuUmXn5TNzQg4ETu3z7PsX9J3a3ur/lvVgBqEK0+eRLyFSzibc
	75iJRJCE5WZQlffoaoWm8K7QLruobgbTaVxq7GI3D44qLc5TLZFsQ5XCGpnJkGURvRB
	aHXXRuyYSSy1lgE6CfU8ocz/xzglJ3fsqUYZsbEY=
Content-Type: multipart/mixed; boundary="===============2947919229204887402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b2973-e9b7e255-73fb-4b19-a7dc-466698fd4dc6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176637

--===============2947919229204887402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.20.5-1.22.0.patch
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
--===============2947919229204887402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.20.5-1.22.0.patch"

RnJvbSA0MWE3M2Q2MjY4NzVmNDVlODNkZjAwN2JlZDhlZGEwYjZjMzgyOWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjoxNDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjIwLjUgLT4gMS4yMi4wCgotLS0KIC4uLi97Z3N0LWRldnRv
b2xzXzEuMjAuNS5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yMi4wLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRldnRvb2xzXzEuMjAuNS5iYiA9
PiBnc3QtZGV2dG9vbHNfMS4yMi4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMC41LmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjIyLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjIwLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi4wLmJiCmluZGV4IDlkYjMxYzE4ZTQuLjNlOWE3
ODlkMjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Qt
ZGV2dG9vbHNfMS4yMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMi4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRv
b2xzLSR7UFZ9CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50
LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNTY4NDQzNjEyMWI4YmFlMDdmZDAwYjc0Mzk1Zjk1ZTQ0YjVmMjYzMjNkY2U0ZmEw
NDVmYTY2NTY3NjgwN2JiYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZDIxZmVlNWMxNWYyODc3
YzBiMWY2YzJkYTBjZGJhNjdjZTdjYWFiMmMxOTlhYjI3ZTkxYTEzOTRkNWJhMTk1IgogCiBERVBF
TkRTID0gImpzb24tZ2xpYiBnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoy
LjM3LjMKCg==

--===============2947919229204887402==
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
meta-yocto-bsp       = "tmp-auh-upgrades:ece98ff20d19f7cad910eb16922dfb2a9deffb2c"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 156 Local 149 Mirrors 0 Missed 7 Current 382 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1713 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_fetch)
NOTE: Running task 1841 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_write_config)
NOTE: recipe gst-devtools-1.22.0-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_unpack)
NOTE: Running task 1884 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.0-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_patch)
NOTE: recipe gst-devtools-1.22.0-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_populate_lic)
NOTE: recipe gst-devtools-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 1896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_configure)
NOTE: recipe gst-devtools-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate
 _sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/buil
 d/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glib-2.0', 'glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gobject-introspection', 'json-glib', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'zlib', 'opkg-utils', 'python3', 'libffi', 'autoconf-archive', 'bash-completion', 'libpcre2', 'util-linux', 'linux-libc-headers', 'libgcc', 'zlib-native', 'libnsl2-native', 'libtirpc-native', 'libffi-native', 'ncurses-native', 'gdbm-native', 'sqlite3-native', 'libtool-native', 'openssl-native', 'util-linux-libuuid-native', 'readline-native', 'bzip2-native', 'flex-native', 'libpcre2-native', 'gettext-minimal-native', 'util-linux-native', 'python3-installer-native', 'python3-build-native', 'python3-setuptools-native', 'python3-wheel-native', 're2c-native', 'texinfo-dummy-native', 'attr-native
 ', 'libxv', 'libx11', 'libdrm', 'alsa-lib', 'wayland-protocols', 'libvorbis', 'wayland', 'libjpeg-turbo', 'orc', 'libogg', 'libtheora', 'libsm', 'mesa', 'libxrender', 'libpng', 'iso-codes', 'pango', 'libxml2', 'mpfr-native', 'gmp-native', 'gnu-config-native', 'zstd-native', 'libmpc-native', 'binutils-cross-i686', 'readline', 'libnsl2', 'sqlite3', 'util-linux-libuuid', 'libtirpc', 'gdbm', 'bzip2', 'xz', 'libxcrypt', 'ncurses', 'openssl', 'libpam', 'libcap-ng', 'perl-native', 'm4-native', 'libcap-ng-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'libxext', 'xorgproto', 'util-macros', 'xtrans', 'libxcb', 'libpciaccess', 'libpthread-stubs', 'expat', 'libice', 'xrandr', 'libxfixes', 'libxshmfence', 'vulkan-loader', 'vulkan-headers', 'libxdamage', 'libxxf86vm', 'freetype', 'cairo', 'fribidi', 'fontconfig', 'libxft', 'harfbuzz', 'flex', 'cracklib', 'make-native', 'unzip-native', 'libxau', 'libxdmcp', 'xcb-proto', 'libxrandr', 'pixman', 'i
 cu']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Ddebug_viewer=disabled -Dtests=disabled -Dvalidate=enabled -Dnls=enabled -Dcairo=disabled...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/gst-devtools-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/build
| Build type: cross build
| Project name: gst-devtools
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-devtools-1.22.0/meson.build:82:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693, line 179
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693, line 168
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693, line 192
NOTE: recipe gst-devtools-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1888 tasks of which 1880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-devtools-1.22.0-r0 do_configure: meson failed
ERROR: gst-devtools-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/run.do_configure.746693', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gst-devtools/1.22.0-r0/temp/log.do_configure.746693
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb:do_configure) failed with exit code '1'

--===============2947919229204887402==--

