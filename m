Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74374C49EA1
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13585.1713248038243705258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EoLOEBfZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=r4FWEwOT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a9eaa-3a01f77a-05d9-4d3a-88e1-100a679fc867-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fQr2BcXfXz51w50BvEr9Ip7tf73Pbp3pTv780gyabLs=;
	b=EoLOEBfZTDATxGPA2eafN8QYwZJ88PraRyBIgEt8/gxx1LHMJbNt7/BIUznUt24t
	5nrbmuhSQ1qX1ozH15G/75q8/5eIxSvDmRQ6UuZLQuKaMrs2IF83w9si3N0Ktmg4hnJ
	1NxIWloZipAEDgM/SBZvNmqPA6wuV9Bg8+caUmDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fQr2BcXfXz51w50BvEr9Ip7tf73Pbp3pTv780gyabLs=;
	b=r4FWEwOToUdIsCPjh7FM1Cn8nXuaNK4SpzeqmADzVOdWBLN8QA5cRGxDG3ZcfhXa
	I9jGTKo+GveKKTbSURIjlTuuMYpQtmuXh5mILSNx/bzWr6wxsCl2L8rOwGDE6nQsSiK
	aQSxEc4Bd+BtrHcTM0LVikE4zPE4hzt0xxrCtUuc=
Content-Type: multipart/mixed; boundary="===============2391468031990597830=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.24.2 FAILED
Message-ID: <0101018ee58a9eaa-3a01f77a-05d9-4d3a-88e1-100a679fc867-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198395

--===============2391468031990597830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.24.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.2.patch
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
From fb7fef41622700082bdcb38a1cf03657bbc36109 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 01:51:41 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.22.11 -> 1.24.2

---
 ...gins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb
index 61f46fbf7e..c307c2b379 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "45da98bf1040c9472fd59f6271282de25a3721ab85b78aaaf8104949550fbef5"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.42.0


--===============2391468031990597830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-46de850091a20ffe95e5da18847f80231c85a983"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46de850091a20ffe95e5da18847f80231c85a983"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 329 Local 317 Mirrors 0 Missed 12 Current 598 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2303 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_recipe_qa)
NOTE: Running task 2421 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2548 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_fetch: Succeeded
NOTE: Running task 2549 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_unpack)
NOTE: Running task 2550 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_patch)
NOTE: Running task 2552 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_patch: Succeeded
NOTE: Running task 2553 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2554 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2555 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/liba52/liba
 52_0.7.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'v
 irtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugin
 s-base', 'gstreamer1.0', 'liba52', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'mpeg2dec', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlit
 e3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dnls=enabled -Dgpl=enabled -Ddoc=disabled -Dsidplay=disabled -Da52dec=enabled -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled -Ddvdread=disabled -Dmpeg2dec=enabled -Dorc=enabled -Dx264=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/gst-plugins-ugly-1.24.2
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/build
| Build type: cross build
| 
| ../gst-plugins-ugly-1.24.2/meson.build:1:0: ERROR: Unknown options: "amrnb, amrwbdec"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481, line 171
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481, line 160
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481, line 184
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2555 tasks of which 2545 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416015036.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416015036.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-ugly-1.24.2-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-ugly-1.24.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/run.do_configure.2208481', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.2/temp/log.do_configure.2208481
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.2.bb:do_configure) failed with exit code '1'

--===============2391468031990597830==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.2.patch"

RnJvbSBmYjdmZWY0MTYyMjcwMDA4MmJkY2IzOGExY2YwMzY1N2JiYzM2MTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDE6NTE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5OiB1cGdyYWRlIDEuMjIuMTEgLT4gMS4yNC4yCgotLS0K
IC4uLmdpbnMtdWdseV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
NC4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlf
MS4yNC4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuMTEuYmIgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yMi4xMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LXVnbHlfMS4yNC4yLmJiCmluZGV4IDYxZjQ2ZmJmN2UuLmMzMDdjMmIzNzkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11
Z2x5XzEuMjIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC4yLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19V
UkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRhci54eiBcCiAgICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzU4YjdkZWNmZDIwYzAwY2FlNTcw
MDgyMmJjYmJmMDNmOThjNzIzZTMzZTE3NjM0ZGIyZTA3Y2ExZGE2MGJmIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjQ1ZGE5OGJmMTA0MGM5NDcyZmQ1OWY2MjcxMjgyZGUyNWEzNzIxYWI4NWI3OGFh
YWY4MTA0OTQ5NTUwZmJlZjUiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy11Z2x5LSR7
UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============2391468031990597830==--

