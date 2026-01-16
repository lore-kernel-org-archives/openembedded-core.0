Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A13D44C4E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1473.1768526746627321143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wS4Vi/wL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qrMTq8DU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc46890c7-85de7c26-3296-4d3a-9ca2-ec7c38f2d95a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rmEKxKbFhZ5rxt3oeGJsMNiNGnpKaosBX9wOIYnIFWc=;
	b=wS4Vi/wLn9FwiwmdzlH1Jf5eZLmhN5twrydq0Xrg8qu3qbjgMi0c7MyogOYqzVWe
	HjP7M2YuNpALJvCVDWSbbIrXC81InPYuQa0N8Svhvde46MgkXik1byQQxPhtX8WXQFc
	/Kk+Eel7tyizoHyGLcTuqB84IKXlGcaUfNm9/rro=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rmEKxKbFhZ5rxt3oeGJsMNiNGnpKaosBX9wOIYnIFWc=;
	b=qrMTq8DUBDZ+PzdM7zyBBXtr1iESXJHjuM4XhWqfzUC+Mh7eUkqLFkGFb2SBahCZ
	zYEjDYQgSNnB46uLDBSP3meT/fwW6oKtJj0NjVyLcETMzQqc/u+d2bIeWd5ljNIiSud
	5U5r/3oiBOZMW5TRiBg9DLUI9mq7MJ165h4bWIaA=
Content-Type: multipart/mixed; boundary="===============8949945455153596695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] orc: upgrading to 0.4.42 FAILED
Message-ID: <0101019bc46890c7-85de7c26-3296-4d3a-9ca2-ec7c38f2d95a-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229461

--===============8949945455153596695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *orc* to *0.4.42* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.41-0.4.42.patch
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
From 3016d52dcd44f4c27f6975857e63e17b0d468a52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:34:21 +0000
Subject: [PATCH] orc: upgrade 0.4.41 -> 0.4.42

---
 meta/recipes-devtools/orc/{orc_0.4.41.bb => orc_0.4.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.41.bb => orc_0.4.42.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.41.bb
rename to meta/recipes-devtools/orc/orc_0.4.42.bb
index 60677577b0..0fd327de4e 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98467fa2"
+SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd122c90c"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.47.1


--===============8949945455153596695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e221a31b0e92e707bd8d741cbc8e1b7b12371c9c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e221a31b0e92e707bd8d741cbc8e1b7b12371c9c"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 99 Local 90 Mirrors 0 Missed 9 Current 267 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 291 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 350 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 937 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: recipe orc-0.4.42-r0: task do_populate_lic_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 359 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1008 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: Running task 1074 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: Running task 1076 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1079 of 1091 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.1.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/sr
 v/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'qemu-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'gtk-doc-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', '
 sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=disabled ...
| The Meson build system
| Version: 1.10.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/build
| Build type: cross build
| 
| ../sources/orc-0.4.42/meson.build:1:0: ERROR: Unknown option: "gtk_doc".
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Main binary: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/nativepython3
| Build Options: -Dgtk_doc=disabled -Dprefix=/usr -Dbindir=/usr/bin -Ddatadir=/usr/share -Dincludedir=/usr/include -Dinfodir=/usr/share/info -Dlibdir=/usr/lib -Dlibexecdir=/usr/libexec -Dlocalstatedir=/var -Dmandir=/usr/share/man -Dsbindir=/usr/sbin -Dsharedstatedir=/com -Dsysconfdir=/etc -Dbuildtype=plain -Dwrap_mode=nodownload --cross-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/meson.cross --native-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/meson.native
| Python system: Linux
| The Meson build system
| Version: 1.10.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/build
| Build type: cross build
| 
| ../sources/orc-0.4.42/meson.build:1:0: ERROR: Unknown option: "gtk_doc".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190, line 172
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190, line 161
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190, line 185
NOTE: recipe orc-0.4.42-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1079 tasks of which 1072 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115203408.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115203408.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/log.do_configure.587190
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: orc-0.4.42-r0 do_configure: meson setup failed
ERROR: orc-0.4.42-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/run.do_configure.587190' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/orc/0.4.42/temp/log.do_configure.587190
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure) failed with exit code '1'

--===============8949945455153596695==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.41-0.4.42.patch"

RnJvbSAzMDE2ZDUyZGNkNDRmNGMyN2Y2OTc1ODU3ZTYzZTE3YjBkNDY4YTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6MzQ6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cmM6IHVwZ3JhZGUgMC40LjQxIC0+IDAuNC40MgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
b3JjL3tvcmNfMC40LjQxLmJiID0+IG9yY18wLjQuNDIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL29yYy97b3JjXzAuNC40MS5iYiA9PiBvcmNfMC40LjQyLmJifSAoOTIlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40MS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40Mi5iYgppbmRleCA2MDY3NzU3N2Iw
Li4wZmQzMjdkZTRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18w
LjQuNDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjQyLmJiCkBA
IC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTE0MDBiZDlkMDllOGFmNTZiOWVj
OTgyYjNkODU3OTdlIgogCiBTUkNfVVJJID0gImh0dHA6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy9vcmMvb3JjLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYjFi
ZmQ0ZjY1NTI4OWNkMzliYzA0NjQyZDU5N2JlOWRlNTQyNzYyM2YwODYxYzFmYzE5YzA4ZDk4NDY3
ZmEyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlYzkxMmFiNTlhZjNjYzk3ODc0YzQ1NmE1NmE4
YWUxZWVjNTIwYzM4NWVjNDQ3ZThhMTAyYjJiZDEyMmM5MGMiCiAKIGluaGVyaXQgbWVzb24gcGtn
Y29uZmlnIGd0ay1kb2MKIAotLSAKMi40Ny4xCgo=

--===============8949945455153596695==--

