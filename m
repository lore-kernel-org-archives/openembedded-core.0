Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F95CCD12AE
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44903.1711995071054293007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ri4SoInI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EMyY7opM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9adba7a5-35a4b745-6d80-453e-bac2-5362dbafce70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/yZwJL0StUT4tm4KqWl3DB6sKIWkoeKV2GlAtUzmPkE=;
	b=Ri4SoInIAOrJLpUSj9kRgsmYlWMXKy77QuTcGrNUWKkFj5SEH9yPwB1eYwirV6bV
	TnR2L3cB/MPsN7gid6GtG0Pk70NF/Kbb52S488tMV87Mny7beXOGHTgED5dzVVVUAGM
	+VKnaMeEq1NYRsA5LhaXOCIm5vBlRABALG6Dv6ys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/yZwJL0StUT4tm4KqWl3DB6sKIWkoeKV2GlAtUzmPkE=;
	b=EMyY7opMYHVcfQhLUoARDVfMfGjSZtbJvh9Uo8IRZFlhNzt+YyVZHYpztYUiYhgX
	NDGnfn2pKRjPamq09h/P0KrgqRMRdQ7q09yK0OJBO3E+O95Iaebm0uYIkhOKKcoMPVA
	3nld8qVHdBX0RQXaHi2f5sLe68HAc4OJCCEeTU1Y=
Content-Type: multipart/mixed; boundary="===============0657391043514586836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.24.1 FAILED
Message-ID: <0101018e9adba7a5-35a4b745-6d80-453e-bac2-5362dbafce70-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197823

--===============0657391043514586836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.24.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.1.patch
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
From f22c790ca5a1028e89c9b31ea557a336e2948495 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 15:56:27 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.22.11 -> 1.24.1

---
 ...gins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb
index 61f46fbf7e..6a55d316a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "6462d36ce64b74203a8b302c109e762b1dd404a6235dfec3c4255106b7b86976"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.42.0


--===============0657391043514586836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-d6bff4a91b5e9abbaec9243305c5bb79e1f88ec3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d6bff4a91b5e9abbaec9243305c5bb79e1f88ec3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 336 Local 324 Mirrors 0 Missed 12 Current 591 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2303 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_recipe_qa)
NOTE: Running task 2421 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2548 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 2549 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_unpack)
NOTE: Running task 2550 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_patch)
NOTE: Running task 2552 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 2553 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2554 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2555 of 2567 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/liba52/liba
 52_0.7.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'v
 irtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugin
 s-base', 'gstreamer1.0', 'liba52', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'mpeg2dec', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlit
 e3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dnls=enabled -Dgpl=enabled -Ddoc=disabled -Dsidplay=disabled -Da52dec=enabled -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled -Ddvdread=disabled -Dmpeg2dec=enabled -Dorc=enabled -Dx264=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/gst-plugins-ugly-1.24.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/build
| Build type: cross build
| 
| ../gst-plugins-ugly-1.24.1/meson.build:1:0: ERROR: Unknown options: "amrnb, amrwbdec"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096, line 171
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096, line 160
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096, line 184
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2555 tasks of which 2545 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401155605.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401155605.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-ugly-1.24.1-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-ugly-1.24.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/run.do_configure.2658096', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.1/temp/log.do_configure.2658096
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.1.bb:do_configure) failed with exit code '1'

--===============0657391043514586836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.1.patch"

RnJvbSBmMjJjNzkwY2E1YTEwMjhlODljOWIzMWVhNTU3YTMzNmUyOTQ4NDk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNTo1NjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHk6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjI0LjEKCi0tLQog
Li4uZ2lucy11Z2x5XzEuMjIuMTEuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0
LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjIuMTEuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjI0LjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIyLjExLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
dWdseV8xLjI0LjEuYmIKaW5kZXggNjFmNDZmYmY3ZS4uNmE1NWQzMTZhMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVn
bHlfMS4yMi4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VS
SSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3NThiN2RlY2ZkMjBjMDBjYWU1NzAw
ODIyYmNiYmYwM2Y5OGM3MjNlMzNlMTc2MzRkYjJlMDdjYTFkYTYwYmYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNjQ2MmQzNmNlNjRiNzQyMDNhOGIzMDJjMTA5ZTc2MmIxZGQ0MDRhNjIzNWRmZWMz
YzQyNTUxMDZiN2I4Njk3NiIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLXVnbHktJHtQ
Vn0iCiAKLS0gCjIuNDIuMAoK

--===============0657391043514586836==--

