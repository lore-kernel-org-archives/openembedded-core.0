Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9483C3DA50
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1297.1715794339902533551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MNYWsTME;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NIf7DYMB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fe620-c05ef3d4-aa99-4a4e-b694-25574734d4ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HJcJ4S4+4I02/H0ONgV2daEdnviZOt+E87UEvgRhg4Q=;
	b=MNYWsTME6CQUxUgcq6XMz0Iib95SK7dx2fcFnDe+H6iYsy3Hiez1pX//bM8NK8F9
	XKUplXGBuWZGbVcTFhrGH1Vl9snODaJ8LbfZKK9mbsg5klIuVq76nNuGP0xLgpH98Eh
	93UglqHBHY6BIaqNHrwNecdqVYRs9DCjwgXKUG6A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HJcJ4S4+4I02/H0ONgV2daEdnviZOt+E87UEvgRhg4Q=;
	b=NIf7DYMBuPbOzcr3k0DkHDv+RuedvSnY4SKz4gfeJQB/n3S4Ft8PboE4wo8bYEYg
	qlm82AdVQHGfFLFzVfKj13kGf6h5wxnoXGo/SxkEOtaoJ959FqpL1P+Bxm/nSNuRJcl
	BJsDiNCRpb969VXk/RvtOglD4RUw3A50XOwMF+UA=
Content-Type: multipart/mixed; boundary="===============5264052064226266887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.24.3 FAILED
Message-ID: <0101018f7d4fe620-c05ef3d4-aa99-4a4e-b694-25574734d4ed-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199402

--===============5264052064226266887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.24.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.3.patch
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
From b1f51fa1c49968c46cd707642d973134c20d7824 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 15:46:34 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.22.11 -> 1.24.3

---
 ...gins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
index 99f41d4f3d..a6a29605d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "4c951341c4c648630b6fe1234ec113d81dd2d248529bf2b5478e0ad077c80ed3"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.44.0


--===============5264052064226266887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fe9ab9517091c12e4f801a32e8600e217feac200"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fe9ab9517091c12e4f801a32e8600e217feac200"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 342 Local 331 Mirrors 0 Missed 11 Current 577 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 771 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2311 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_fetch)
NOTE: Running task 2414 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_fetch: Succeeded
NOTE: Running task 2535 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_unpack)
NOTE: Running task 2536 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 2537 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_patch)
NOTE: Running task 2538 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 2539 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2540 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_populate_lic unihash changed to cbe30e72ac48d552fa8999978438debc8b77f73cc2ea557b167f94a43a6ef04a
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_deploy_source_date_epoch unihash changed to 3d56339b678ae09413d0f3c881a8204741db6c74e0d0ff494b21edc857feb6d4
NOTE: Setscene tasks completed
NOTE: Running task 2541 of 2553 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ge
 ttext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do
 _populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugin
 s-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dnls=enabled -Dgpl=disabled -Ddoc=disabled -Dsidplay=disabled -Da52dec=disabled -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled -Ddvdread=disabled -Dmpeg2dec=disabled -Dorc=enabled -Dx264=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/gst-plugins-ugly-1.24.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/build
| Build type: cross build
| 
| ../gst-plugins-ugly-1.24.3/meson.build:1:0: ERROR: Unknown options: "amrnb, amrwbdec"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554, line 171
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554, line 160
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554, line 184
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2541 tasks of which 2532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515154612.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515154612.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-ugly-1.24.3-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-ugly-1.24.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/run.do_configure.3139554', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-ugly/1.24.3/temp/log.do_configure.3139554
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb:do_configure) failed with exit code '1'

--===============5264052064226266887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.22.11-1.24.3.patch"

RnJvbSBiMWY1MWZhMWM0OTk2OGM0NmNkNzA3NjQyZDk3MzEzNGMyMGQ3ODI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTU6NDY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5OiB1cGdyYWRlIDEuMjIuMTEgLT4gMS4yNC4zCgotLS0K
IC4uLmdpbnMtdWdseV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
NC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlf
MS4yNC4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuMTEuYmIgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjMu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yMi4xMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LXVnbHlfMS4yNC4zLmJiCmluZGV4IDk5ZjQxZDRmM2QuLmE2YTI5NjA1ZDYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11
Z2x5XzEuMjIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC4zLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19V
UkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRhci54eiBcCiAgICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzU4YjdkZWNmZDIwYzAwY2FlNTcw
MDgyMmJjYmJmMDNmOThjNzIzZTMzZTE3NjM0ZGIyZTA3Y2ExZGE2MGJmIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjRjOTUxMzQxYzRjNjQ4NjMwYjZmZTEyMzRlYzExM2Q4MWRkMmQyNDg1MjliZjJi
NTQ3OGUwYWQwNzdjODBlZDMiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy11Z2x5LSR7
UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============5264052064226266887==--

