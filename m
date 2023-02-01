Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7F0C64EC5
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30353.1675272854130532536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nT8BSKL1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b3081-49dc3e1e-c182-49de-8c64-7a4a90f405cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272859;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sr34IW9Cqa+PPX97fm66VV87lNSOBANUN6D3eoUzruA=;
	b=nT8BSKL1la+qkA07QYToto8/9uG/keRn21AJzDfoecLWI0YNcbCTwkzgHaHEn/NL
	+tPytub8Z58menh04npMBCYDEzqnnJlDorN43ljBYjio20Q3mUPk0+BQidG/NWZYt0h
	xkK4sAVGc2zbqcSwHaHXYUAfeDmhMf4gmshpnmYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272859;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sr34IW9Cqa+PPX97fm66VV87lNSOBANUN6D3eoUzruA=;
	b=dL9dWlNHQ9UCySliydMiyT7dSj1DGuUHhvptHIpooBFYLI10srF7DK83y3/1X7Xz
	/GDA0Se/695KeHYJB7zhLbrVchlrf4TFIvJfhf5su7aAPmzGCLOrPLpspJwYGXV/iWH
	ym8lT60ycIgu3WJqlL3bnoE4Tran9ryrTdIn31Dg=
Content-Type: multipart/mixed; boundary="===============0076816022672502622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.22.0 FAILED
Message-ID: <010101860e0b3081-49dc3e1e-c182-49de-8c64-7a4a90f405cb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176650

--===============0076816022672502622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.20.5-1.22.0.patch
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
--===============0076816022672502622==
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
meta-yocto-bsp       = "tmp-auh-upgrades:628ba3f0cc1e89728353df622889d7e7a8660d47"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 144 Local 137 Mirrors 0 Missed 7 Current 368 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1670 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_fetch)
NOTE: Running task 1784 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_unpack)
NOTE: Running task 1796 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1798 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1799 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1800 of 1808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/g
 streamer1.0_1.20.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild
 /yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gobject-introspection', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'gettext-minimal-native', 'libtool-native', 'linux-libc-headers', 'libgcc', 'readline-native', 'util-linux-libuuid-native', 'zlib-native', 'gdbm-native', 'libtirpc-native', 'sqlite3-native', 'bzip2-native', 'libnsl2-native', 'openssl-native', 'ncurses-native', 'libffi-native', 'python3-wheel-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-build-native', 're2c-native', 'attr-native', 'flex-native', 'zstd-native', 'texinfo-dummy-native', 'gnu-config-native', 'mpfr-native', 'libmpc-native', 'gmp-native', 'binutils-cross-i686', 'glib-2.0-native', 'libxml2', 'glib-2.0', 'python3', 'libffi', 'opkg-utils', 'zlib', 'autoconf-archive
 ', 'libpng', 'libsm', 'libjpeg-turbo', 'orc', 'wayland-protocols', 'mesa', 'libdrm', 'alsa-lib', 'libx11', 'wayland', 'pango', 'util-linux', 'libxv', 'libogg', 'iso-codes', 'libxrender', 'libtheora', 'libvorbis', 'perl-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'm4-native', 'gettext-native', 'libpcre2-native', 'util-linux-native', 'bash-completion', 'libpcre2', 'libnsl2', 'libxcrypt', 'gdbm', 'sqlite3', 'bzip2', 'openssl', 'xz', 'ncurses', 'libtirpc', 'util-linux-libuuid', 'readline', 'util-macros', 'libice', 'xorgproto', 'xtrans', 'libxfixes', 'expat', 'libxdamage', 'vulkan-loader', 'xrandr', 'libxshmfence', 'libxxf86vm', 'vulkan-headers', 'libxext', 'libpciaccess', 'libpthread-stubs', 'libxcb', 'harfbuzz', 'fontconfig', 'fribidi', 'libxft', 'cairo', 'freetype', 'libcap-ng', 'libpam', 'make-native', 'unzip-native', 'libcap-ng-native', 'libxrandr', 'libxau', 'libxdmcp', 'xcb-proto', 'icu', 'pixman', 'flex', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Dexamples=disabled -Dtests=disabled ...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/gst-rtsp-server-1.22.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/build
| Build type: cross build
| Project name: gst-rtsp-server
| Project version: 1.22.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency gstreamer-1.0 found: NO found 1.20.5 but need: '>= 1.22.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-rtsp-server-1.22.0/meson.build:139:0: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504:178 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504, line 178
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504, line 167
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504, line 191
NOTE: recipe gstreamer1.0-rtsp-server-1.22.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1800 tasks of which 1792 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-rtsp-server-1.22.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-rtsp-server-1.22.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/run.do_configure.3055504', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-rtsp-server/1.22.0-r0/temp/log.do_configure.3055504
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb:do_configure) failed with exit code '1'

--===============0076816022672502622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.20.5-1.22.0.patch"

RnJvbSA0NjEyODJlZmQ4NjgxZTQ0OTk4NDIyMzIxODAxMzI5N2JjZWVjMjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjozNjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcjogdXBncmFkZSAxLjIwLjUgLT4gMS4yMi4wCgotLS0KIC4u
LnJ0c3Atc2VydmVyXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXJ0c3Atc2VydmVyXzEuMjAuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4w
LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIwLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4w
LmJiCmluZGV4IGM5Y2Y0MjkwM2QuLmY5NDNjODI5YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMC41LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yMi4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1z
ZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImJhMzk4YTdkZGQ1NTljY2U1NmVmNGI5MWY0NDhkMTc0ZTBkY2NhZDk4YTQ5MzU2M2QyZDU5
YzQxYTJlZjM5YzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWVhMjRlZWI1OWVlNWZhZGZhYzM1
NWRlMmY3Y2VjYjUxOTY2YzNlMTQ3ZTVhZDdjZmI0YzMxNGYxYTQwODZlZCIKIAogUyA9ICIke1dP
UktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============0076816022672502622==--

