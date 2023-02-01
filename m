Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7B5C77B7A
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30012.1675272856299364873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SmAVmE1m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b2a22-b1838b07-76b3-485e-b162-26d3d8afa9fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mda4Ghr4JZGo33XZIAVlpp01dTixKIAvEHy3fTsR7U8=;
	b=SmAVmE1mdMHyI+98jfOSOsW4Am5Llhpyxt+KR5XGj2AKzvhhnG2O1zBZK7r/zPdH
	Zr/mQygyHkNCdOQCKKJkaDNqfmKaN/mBD7VG4cYlxjt+VDW94MhjeLwCxgnlitezo4u
	p/WqMa6I8bi7LR972NC9VIrOyu6JIbSi+d0N+4JE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mda4Ghr4JZGo33XZIAVlpp01dTixKIAvEHy3fTsR7U8=;
	b=jsRbs+AiZB1/vfHszoahuTCqkhmLkUtMDXNV+jtlE5eL1N0ysF6WvYuF66/CpE7v
	y6a6H3gzdHTD56Nb386ba6fInkiiMTP/1DlTaJPh7xu+YAbL5P+RXhhnTau5IxZKsVj
	zhfHhAaRlt5CP6jYsn2g4Vhcb9XxhlsvdtIanI1o=
Content-Type: multipart/mixed; boundary="===============0433777249172547024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b2a22-b1838b07-76b3-485e-b162-26d3d8afa9fc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176632

--===============0433777249172547024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.20.5-1.22.0.patch
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
--===============0433777249172547024==
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
meta-yocto-bsp       = "tmp-auh-upgrades:07a361dd328124c639258aeba044ba9f3aab5bf8"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 180 Local 173 Mirrors 0 Missed 7 Current 517 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2331 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_fetch)
NOTE: Running task 2433 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2444 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_unpack)
NOTE: Running task 2445 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2446 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2447 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2448 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2449 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstre
 amer1.0_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoct
 o-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libomxil', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libtool-native', 'attr-native', 'gettext-minimal-native', 'wayland', 'libsm', 'wayland-protocols', 'libpng', 'libvorbis', 'libjpeg-turbo', 'gobject-introspection', 'zlib', 'libdrm', 'mesa', 'pango', 'libtheora', 'libogg', 'libx11', 'libxrender', 'libxv', 'iso-codes', 'util-linux', 'alsa-lib', 'orc', 'glib-2.0', 'libxml2', 'libwebp', 'librsvg', 'vulkan-loader', 'libusb1', 'sbc', 'curl', 'openssl', 'libgudev', 'bluez5', 'bzip2', 'libxcb', 'libsndfile1', 'libxkbcommon', 'cairo', 'glib-2.0-native', 'zlib-native', 're2c-native', 'linux-libc-headers', 'flex-native', 'mpfr-native', 'texinfo-dummy-native', 'libmpc-native', 'zstd-native', 'gmp-native', 'gnu-config-native', 'b
 inutils-cross-i686', 'libgcc', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'python3-wheel-native', 'sqlite3-native', 'libffi-native', 'util-linux-libuuid-native', 'libtirpc-native', 'bzip2-native', 'gdbm-native', 'openssl-native', 'readline-native', 'ncurses-native', 'libnsl2-native', 'libffi', 'expat', 'xtrans', 'libice', 'xorgproto', 'util-macros', 'opkg-utils', 'autoconf-archive', 'python3', 'libpciaccess', 'libpthread-stubs', 'libxfixes', 'libxdamage', 'libxext', 'vulkan-headers', 'xrandr', 'libxxf86vm', 'libxshmfence', 'fontconfig', 'freetype', 'fribidi', 'libxft', 'harfbuzz', 'ncurses', 'bash-completion', 'libxcrypt', 'libcap-ng', 'util-linux-libuuid', 'libpam', 'libpcre2', 'gdk-pixbuf', 'vala', 'libstd-rs', 'libxrandr', 'systemd', 'libidn2', 'readline', 'initscripts', 'dbus', 'update-rc.d', 'libical', 'xcb-proto', 'libxdmcp', 'libxau', 'flac', 'xkeyboard-config', 'pixman', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'm4-nativ
 e', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'perl-native', 'libtirpc', 'gdbm', 'xz', 'sqlite3', 'libnsl2', 'icu', 'cracklib', 'flex', 'shared-mime-info', 'shadow-sysroot', 'shadow-native', 'shadow', 'zstd', 'acl', 'libcap', 'kmod', 'base-passwd', 'base-files', 'libseccomp', 'libunistring', 'libcap-ng-native', 'unzip-native', 'make-native', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtarget=bellagio ...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/gst-omx-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/build
| Build type: cross build
| Project name: gst-omx
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-omx-1.22.0/meson.build:142:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477, line 186
NOTE: recipe gstreamer1.0-omx-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2449 tasks of which 2441 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-omx-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-omx-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/run.do_configure.1441477', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-omx/1.22.0-r0/temp/log.do_configure.1441477
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb:do_configure) failed with exit code '1'

--===============0433777249172547024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.20.5-1.22.0.patch"

RnJvbSBjZTI2NjJhMTg1MDNhYzRjYjg3YzcyNWEwM2VjNTA2NDZiOGJmNmFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjoyMzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMC41IC0+IDEuMjIuMAoKLS0tCiAuLi4ve2dzdHJl
YW1lcjEuMC1vbXhfMS4yMC41LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1vbXhfMS4y
MC41LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjAu
NS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214
XzEuMjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIwLjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
MC5iYgppbmRleCBlYzVlZmNkNDA4Li5lZDRjNDQ1ODNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIwLjUuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi4w
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIAogU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1vbXgvZ3N0LW9teC0ke1BWfS50
YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2NjYmMwMjU0OGNkYzEyM2ZkNDk5NDRk
ZDQ0YTRmMWFkYzVkMTA3ZTM2ZjAxMGQzMjBlYjUyNmUyMTA3ODA2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRiYzk1MWE5OWFmNTMyMzgwZTU5OWFhOGFjZDllMTM4NWZkYjI5OWI0NmI1ODY4Y2Qy
YmU0MjMwYWQ4ODgzNDEiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3Qtb214LSR7UFZ9IgogCi0tIAoy
LjM3LjMKCg==

--===============0433777249172547024==--

