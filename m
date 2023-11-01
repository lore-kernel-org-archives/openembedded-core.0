Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BA7C07208
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8502.1698848706334122969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DWSYhN6h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nZv0Vpcf;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b460ca9-e7fe1eb5-ad73-4d35-9837-2db8961531d7-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZvyMPZ2qDoyxfIwGrrIYVUWnyXR6tu0aTHgtXq2k4G0=;
	b=DWSYhN6hNAgm+3HPBLkmMOrb+H9h5KEC7WYIgYRUaVdb2DH2CMg5qWABHW7m+rzD
	2wV9b96F0chq2LUpY+lNRsiCWh9FfaEX/Fij7B1gH74zJXsnJJv6AkOvvfiFiCdoucl
	xPqjgWxGfMbfH1NNcwmWGZOiWnnZwyM+VADpy6vM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZvyMPZ2qDoyxfIwGrrIYVUWnyXR6tu0aTHgtXq2k4G0=;
	b=nZv0Vpcf+X2xErCS/PXx4TBAyL/n74aJSb7aUjwV7w46hMEclkZWVcGBpiwlSZzz
	wYKeWwhtJrj7w8wrEB50BCeaxHNMsXyyKyota61NBQ02WKp4pm8dyFwwukRm7vfGM+r
	bdvQUv7D6gs308iyviUNP7KbTsB/QK2kdCYC0nGk=
Content-Type: multipart/mixed; boundary="===============3525780863740500780=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.0.0 FAILED
Message-ID: <0101018b8b460ca9-e7fe1eb5-ad73-4d35-9837-2db8961531d7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190016

--===============3525780863740500780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *virglrenderer* to *1.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-0.10.4-1.0.0.patch
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
From 6129826faf5b1c5886c4482ff0e5f807c5f27bb5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:06:35 +0000
Subject: [PATCH] virglrenderer: upgrade 0.10.4 -> 1.0.0

---
 ...1-meson.build-use-python3-directly-for-python.patch | 10 +++++-----
 ...{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} (94%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 8230ba588b..d2c17b6df9 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
+From feeaf8e66c1b3ac80e429877bd69d65642761ed5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -14,15 +14,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 13d95bb..b241eb2 100644
+index de6d16b5..79cedbf6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -64,7 +64,7 @@ flags = [
+@@ -68,7 +68,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- libdrm_dep = dependency('libdrm', version : '>=2.4.50')
- thread_dep = dependency('threads')
+ not_found = dependency('', required: false)
+ libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
similarity index 94%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
index f76e7cb1b9..7af0e9c8ee 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "88b9fe3bfc64b23a701e4875006dbc0e769f14f6"
-SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
+SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
+SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
-- 
2.39.2


--===============3525780863740500780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-23565e9fc986364405bb13ff5092ffa28d58050a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:23565e9fc986364405bb13ff5092ffa28d58050a"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 57 Mirrors 0 Missed 10 Current 571 (85% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1660 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_recipe_qa)
NOTE: Running task 1724 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_write_config)
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1757 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_fetch)
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_unpack)
NOTE: Running task 1759 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.0.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1760 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_patch)
NOTE: Running task 1761 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.0.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1762 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1763 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1764 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure)
NOTE: recipe virglrenderer-1.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot', '/home/pokybuild/yoc
 to-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/p
 ython3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'libx11', 'bzip2-native', 'expat-native', 'libffi-native', 'xz-native', 'zlib-native', 'libtirpc-native', 'util-linux-libuuid-native', 'openssl-native', 'libedit-native', 'gdbm-native', 'sqlite3-native', 'ncurses-native', 'libnsl2-native', 'libtool-native', 'flex-native', 'libmpc-native', 'gnu-config-native', 'gmp-native', 'linux-libc-headers', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'mpfr-native', 'zstd-native', 'glib-2.0-native', 're2c-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'libgcc', 'attr-native', 'libxcb', 'wayland', 'libxrandr', 'libpciaccess', 'libpthread-stubs', 'libxfixes', 'wayland-protocols', 'xrandr', 'li
 bxext', 'xorgproto', 'libxshmfence', 'expat', 'libxxf86vm', 'libxdamage', 'zlib', 'xtrans', 'util-macros', 'cmake-native', 'gettext-minimal-native', 'perl-native', 'm4-native', 'util-linux-native', 'gettext-native', 'libpcre2-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'python3-flit-core-native', 'libxau', 'libxdmcp', 'xcb-proto', 'libffi', 'libxml2', 'libxrender', 'make-native', 'libcap-ng-native', 'unzip-native', 'python3', 'libtirpc', 'util-linux-libuuid', 'opkg-utils', 'xz', 'libxcrypt', 'bzip2', 'ncurses', 'libedit', 'libnsl2', 'openssl', 'sqlite3', 'gdbm']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus-experimental=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "venus-experimental"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643, line 186
NOTE: recipe virglrenderer-1.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1764 tasks of which 1754 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.0.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.2317643', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.0.0/temp/log.do_configure.2317643
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure) failed with exit code '1'

--===============3525780863740500780==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-0.10.4-1.0.0.patch"

RnJvbSA2MTI5ODI2ZmFmNWIxYzU4ODZjNDQ4MmZmMGU1ZjgwN2M1ZjI3YmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzowNjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMC4xMC40IC0+IDEuMC4wCgotLS0KIC4uLjEtbWVzb24uYnVp
bGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8IDEwICsrKysrLS0tLS0K
IC4uLnt2aXJnbHJlbmRlcmVyXzAuMTAuNC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMC4wLmJifSB8
ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3t2aXJnbHJlbmRl
cmVyXzAuMTAuNC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMC4wLmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAw
MS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29u
LmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXggODIzMGJh
NTg4Yi4uZDJjMTdiNmRmOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zpcmds
cmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVj
dGx5LWZvci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5
LWZvci1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM4NTNjOWU1YzQ0ZjFiMjNh
MTVhN2JhNjI5ZWUwMmY3ZDhlYzIzYTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZl
ZWFmOGU2NmMxYjNhYzgwZTQyOTg3N2JkNjlkNjU2NDI3NjFlZDUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSBt
ZXNvbi5idWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0xNCwxNSAr
MTQsMTUgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAxM2Q5NWJi
Li5iMjQxZWIyIDEwMDY0NAoraW5kZXggZGU2ZDE2YjUuLjc5Y2VkYmY2IDEwMDY0NAogLS0tIGEv
bWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtNjQsNyArNjQsNyBAQCBmbGFncyA9
IFsKK0BAIC02OCw3ICs2OCw3IEBAIGZsYWdzID0gWwogIAogIGFkZF9wcm9qZWN0X2FyZ3VtZW50
cyhjYy5nZXRfc3VwcG9ydGVkX2FyZ3VtZW50cyhmbGFncyksIGxhbmd1YWdlIDogJ2MnKQogIAog
LXByb2dfcHl0aG9uID0gaW1wb3J0KCdweXRob24nKS5maW5kX2luc3RhbGxhdGlvbigncHl0aG9u
MycpCiArcHJvZ19weXRob24gPSAncHl0aG9uMycKICAKLSBsaWJkcm1fZGVwID0gZGVwZW5kZW5j
eSgnbGliZHJtJywgdmVyc2lvbiA6ICc+PTIuNC41MCcpCi0gdGhyZWFkX2RlcCA9IGRlcGVuZGVu
Y3koJ3RocmVhZHMnKQorIG5vdF9mb3VuZCA9IGRlcGVuZGVuY3koJycsIHJlcXVpcmVkOiBmYWxz
ZSkKKyBsaWJkcm1fZGVwID0gZGVwZW5kZW5jeSgnbGliZHJtJywgdmVyc2lvbiA6ICc+PTIuNC41
MCcsIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCdkcm0nKS5lbmFibGVkKCkgb3IgZ2V0X29wdGlvbign
dmVudXMnKSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXJfMC4xMC40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzAu
MTAuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjAuMC5iYgppbmRleCBmNzZlN2NiMWI5Li43YWYwZTljOGVlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzAu
MTAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJl
bmRlcmVyXzEuMC4wLmJiCkBAIC05LDggKzksOCBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgzMDlh
NzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFsL2VnbCB2aXJ0dWFs
L2xpYmdibSIKLVNSQ1JFViA9ICI4OGI5ZmUzYmZjNjRiMjNhNzAxZTQ4NzUwMDZkYmMwZTc2OWYx
NGY2IgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3Zpcmds
cmVuZGVyZXIuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAorU1JDUkVWID0gIjlj
OWQ1NWVjYmU1MDJlMGQ3MWVlOTk1Mjk3MDllZmNjYTY5YWFjNDIiCitTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC11
c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIFwKICAgICAgICAgICAgIgogCi0t
IAoyLjM5LjIKCg==

--===============3525780863740500780==--

