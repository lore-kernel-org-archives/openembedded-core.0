Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2686AC6FD18
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30020.1675272858779984795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aKI8fZjo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b29b8-52784c93-c81d-429c-aad7-6e75a604df8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=evpuh0h4haLwHw+DolI+d9sgvR1u5zpoYJV4dMq8IQQ=;
	b=aKI8fZjo5DvOVySKFjFb349ys/lcaC0tTFA30WhzlIfjDiFhtQesxssRqp+DplYQ
	EOA2QYV0vArgBNTig+UPjjBxVTrkkHXE4M0FaeaDaEE/x5LEn5nv5YT4UUJvrIxNO8P
	sznSE6XwfPPyNmNZ8NnVNYAIdf45aFRNROtRkj7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=evpuh0h4haLwHw+DolI+d9sgvR1u5zpoYJV4dMq8IQQ=;
	b=Qnika9R9pNP1bR7mRuS35Yz8VYGonoKsP3H49txjB7ImUx+VSIJ/iYHZ+m2h+39s
	W2MVv5euJIkdAM/fzHso0yIMNLIEPC1Tr2j4kAhWQPWkqacXG9pjqOQoX4isoBA0a0m
	Bq63WKKkRrTNGJsWNnrWZDbv2znWO7Upw5LLrP/w=
Content-Type: multipart/mixed; boundary="===============7984534411329696382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b29b8-52784c93-c81d-429c-aad7-6e75a604df8d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176636

--===============7984534411329696382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.20.5-1.22.0.patch
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
--===============7984534411329696382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.20.5-1.22.0.patch"

RnJvbSAxZDI0NjlkMGEwYmFiNjZkYjkyYzljNTI3MmZhN2M4ODY1Zjg2ZjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjoxNjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIwLjUgLT4gMS4yMi4wCgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yMC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjIyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjIwLjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yMi4wLmJiCmluZGV4IGU1OTI1YzY1MTAuLjYyNWE1MmVhNTUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMi4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjE1MmUzY2M0OWQwMTQ4OTlmNTNjMzlkOGE2MjI0YTQ0ZTEzOTli
NGNmNzZhYTVmOWE5MDNmZGY5NzkzYzNjYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZTQ4NDA3
YjQ5MDUyMjdhMjYwMjEzZGJkYTg0Y2JhMzgxMmYwNTMwZmM3YTc1YjQzODI5MTAyZWY4MjgxMGYx
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============7984534411329696382==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8a2e00b5c56fa51f2693953403739fb910b18e17"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 142 Local 135 Mirrors 0 Missed 7 Current 374 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_fetch)
NOTE: Running task 1796 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_unpack)
NOTE: Running task 1807 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1808 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1809 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1810 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1811 of 1819 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb:do_p
 opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'ffmpeg', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'linux-libc-headers', 'libgcc', 'libxv', 'zlib', 'xz', 'libogg', 'libtheora', 'alsa-lib', 'libxcb', 'bzip2', 'glib-2.0', 'gobject-introspection', 'libxml2', 'glib-2.0-native', 'zlib-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'libffi-native', 'ncurses-native', 'gdbm-native', 'util-linux-libuuid-native', 'libtool-native', 'openssl-native', 'attr-native', 'mpfr-native', 'zstd-native', 'texinfo-dummy-native', 'gmp-native', 'binutils-cross-i686', 'gnu-config-native', 'libmpc-native', 'flex-native', 're2c-native', 'python3-installer-native', 'python3-build-native', 'python3-setuptools-native', 'python3-wheel-native', 'pango', 'libpng', 'libsm', 'li
 bdrm', 'libx11', 'util-linux', 'libxrender', 'wayland', 'iso-codes', 'mesa', 'orc', 'libvorbis', 'wayland-protocols', 'libjpeg-turbo', 'gettext-minimal-native', 'xorgproto', 'util-macros', 'libxext', 'opkg-utils', 'libpthread-stubs', 'xcb-proto', 'libxau', 'libxdmcp', 'libffi', 'bash-completion', 'libpcre2', 'autoconf-archive', 'python3', 'libpcre2-native', 'util-linux-native', 'gettext-native', 'perl-native', 'm4-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'cairo', 'fontconfig', 'harfbuzz', 'freetype', 'libxft', 'fribidi', 'xtrans', 'libice', 'libpciaccess', 'libxcrypt', 'libcap-ng', 'util-linux-libuuid', 'libpam', 'ncurses', 'expat', 'libxshmfence', 'libxdamage', 'xrandr', 'libxfixes', 'libxxf86vm', 'vulkan-loader', 'vulkan-headers', 'openssl', 'readline', 'libtirpc', 'gdbm', 'libnsl2', 'sqlite3', 'libcap-ng-native', 'make-native', 'unzip-native', 'pixman', 'icu', 'cracklib', 'flex', 'libxrandr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled ...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/gst-libav-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/build
| Build type: cross build
| Project name: gst-libav
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libavfilter found: YES 8.44.100
| Run-time dependency libavformat found: YES 59.27.100
| Run-time dependency libavcodec found: YES 59.37.100
| Run-time dependency libavutil found: YES 57.28.100
| Checking if "libav is provided by FFmpeg" with dependencies libavfilter, libavformat, libavcodec, libavutil compiles: YES
| Has header "unistd.h" : YES
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-libav-1.22.0/meson.build:91:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356, line 186
NOTE: recipe gstreamer1.0-libav-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1811 tasks of which 1803 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-libav-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-libav-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/run.do_configure.774356', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-libav/1.22.0-r0/temp/log.do_configure.774356
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb:do_configure) failed with exit code '1'

--===============7984534411329696382==--

