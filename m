Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9861DD10DB3
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.149795.1733047549145508560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D4RJuyP+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cDKiSlbA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019381af3ee8-a10e255b-d1b4-42a9-bbbf-81c2d50c6be0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tm5VL/qveGcY7UkgEtVkPjBJEKoiv/gpHH9XbPTkNA8=;
	b=D4RJuyP+oMRNiwArAKVQnx4Mp6TgMdbuOmZUjHdx5HAUxOB2ia2/5AovAEBuBPJN
	D+DDXg/hCsCCUxarg+buySjm8tQ8Y8V5F4bqLHiOzIZt+Pkubv+Q9YVzzxUC3KcYz/w
	UsZ6AV3G7PHxayTh6MJZ/meglHTL1mrtXUz9weHk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tm5VL/qveGcY7UkgEtVkPjBJEKoiv/gpHH9XbPTkNA8=;
	b=cDKiSlbAc8clHOO7VFF83Os9BcQYtNRyTAwPndgMmE20+3esEZ04csjIWLVSJaSC
	ugLA90aFFZFHJh3teNxnv3g+8/4bDmHWwQGXDqBxB5EhJVL39YhVz/Cu6kl/rVuXI7d
	uJyuHnuNOpS2mdpWnnwTXoHtdked2FEkIsNi/6hM=
Content-Type: multipart/mixed; boundary="===============5696817412474731832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.1.0 FAILED
Message-ID: <0101019381af3ee8-a10e255b-d1b4-42a9-bbbf-81c2d50c6be0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208094

--===============5696817412474731832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.0.1-1.1.0.patch
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
From f9c42f99ab2d19fc37c7abc98ec1c5931ad2a5a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 08:28:50 +0000
Subject: [PATCH] virglrenderer: upgrade 1.0.1 -> 1.1.0

---
 ...001-meson.build-use-python3-directly-for-python.patch | 9 ++++-----
 ...-Fix-int-conversion-fatal-build-error-with-GCC-.patch | 6 +-----
 .../{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb}   | 2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb} (96%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 3e12495970..9e4e7d0e06 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From dec8cca59124d7f8796b54902482ceb295a71b51 Mon Sep 17 00:00:00 2001
+From 900f295eeecd0cfca4b97f3ee71667c47bddf749 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -8,16 +8,15 @@ its configuration).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 9f91ff2f..2391f89d 100644
+index 10be099e..3bb6eec7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -74,7 +74,7 @@ flags = [
+@@ -77,7 +77,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
@@ -25,4 +24,4 @@ index 9f91ff2f..2391f89d 100644
 +prog_python = 'python3'
  
  not_found = dependency('', required: false)
- libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
+ gbm_dep = not_found
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
index 9c49ee512a..ebea5b55bb 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
@@ -1,4 +1,4 @@
-From 464deabe4d1bfce6b8f414ab0945d9a62b66ddd4 Mon Sep 17 00:00:00 2001
+From 4a7e17381e118a940067732eaf69f860a0e67255 Mon Sep 17 00:00:00 2001
 From: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Date: Tue, 8 Oct 2024 11:47:21 +0530
 Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
@@ -19,7 +19,6 @@ Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/
 Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
 ---
-
  src/vrend_winsys_egl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -36,6 +35,3 @@ index 9d9f410c..8750f6b2 100644
  #endif
     } else {
  #ifdef ENABLE_GBM
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
similarity index 96%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 87f25a3461..3a099dd305 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
+SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
-- 
2.44.1


--===============5696817412474731832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8fef582d4f3f8ade52cc18859f47896181660e49"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 268 Local 257 Mirrors 0 Missed 11 Current 419 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 669 of 687 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1788 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: Running task 1828 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1923 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: Running task 1924 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: Running task 1926 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1928 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_populate_lic unihash changed to b8992058d765b831b1b2287de4f85b08dfdecc2e91d5ae959a552eb0bc92b489
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch unihash changed to 95233f5abf27ce4e35a1aeea1931097f927c301d541324ff580142c0ee89f435
NOTE: Setscene tasks completed
NOTE: Running task 1929 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure)
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot', '/srv
 /pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 
 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.6.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/git
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "drm-msm-experimental"
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834, line 183
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1929 tasks of which 1920 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201082835.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201082835.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.1619834
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.1.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.1.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.1619834' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.1619834
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure) failed with exit code '1'

--===============5696817412474731832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.0.1-1.1.0.patch"

RnJvbSBmOWM0MmY5OWFiMmQxOWZjMzdjN2FiYzk4ZWMxYzU5MzFhZDJhNWE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwODoyODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMS4wLjEgLT4gMS4xLjAKCi0tLQogLi4uMDAxLW1lc29uLmJ1
aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2ggfCA5ICsrKystLS0tLQog
Li4uLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gg
fCA2ICstLS0tLQogLi4uL3t2aXJnbHJlbmRlcmVyXzEuMC4xLmJiID0+IHZpcmdscmVuZGVyZXJf
MS4xLjAuYmJ9ICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
e3ZpcmdscmVuZGVyZXJfMS4wLjEuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYn0gKDk2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJl
bmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIv
MDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCmlu
ZGV4IDNlMTI0OTU5NzAuLjllNGU3ZDBlMDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0
aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9u
My1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZWM4Y2Nh
NTkxMjRkN2Y4Nzk2YjU0OTAyNDgyY2ViMjk1YTcxYjUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA5MDBmMjk1ZWVlY2QwY2ZjYTRiOTdmM2VlNzE2NjdjNDdiZGRmNzQ5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBNb24sIDYgSmFuIDIwMjAgMTI6NDQ6NDIgKzAxMDAKIFN1YmplY3Q6
IFtQQVRDSF0gbWVzb24uYnVpbGQ6IHVzZSAncHl0aG9uMycgZGlyZWN0bHkgZm9yIHB5dGhvbgpA
QCAtOCwxNiArOCwxNSBAQCBpdHMgY29uZmlndXJhdGlvbikuCiAKIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBtZXNvbi5idWlsZCB8
IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDlmOTFmZjJmLi4y
MzkxZjg5ZCAxMDA2NDQKK2luZGV4IDEwYmUwOTllLi4zYmI2ZWVjNyAxMDA2NDQKIC0tLSBhL21l
c29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTc0LDcgKzc0LDcgQEAgZmxhZ3MgPSBb
CitAQCAtNzcsNyArNzcsNyBAQCBmbGFncyA9IFsKICAKICBhZGRfcHJvamVjdF9hcmd1bWVudHMo
Y2MuZ2V0X3N1cHBvcnRlZF9hcmd1bWVudHMoZmxhZ3MpLCBsYW5ndWFnZSA6ICdjJykKICAKQEAg
LTI1LDQgKzI0LDQgQEAgaW5kZXggOWY5MWZmMmYuLjIzOTFmODlkIDEwMDY0NAogK3Byb2dfcHl0
aG9uID0gJ3B5dGhvbjMnCiAgCiAgbm90X2ZvdW5kID0gZGVwZW5kZW5jeSgnJywgcmVxdWlyZWQ6
IGZhbHNlKQotIGxpYmRybV9kZXAgPSBkZXBlbmRlbmN5KCdsaWJkcm0nLCB2ZXJzaW9uIDogJz49
Mi40LjUwJywgcmVxdWlyZWQ6IGdldF9vcHRpb24oJ2RybScpLmVuYWJsZWQoKSBvciBnZXRfb3B0
aW9uKCd2ZW51cycpKQorIGdibV9kZXAgPSBub3RfZm91bmQKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgt
aW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZp
eC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKaW5kZXgg
OWM0OWVlNTEyYS4uZWJlYTViNTViYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lv
bi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29u
dmVyc2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQ2NGRlYWJlNGQxYmZjZTZiOGY0MTRhYjA5NDVkOWE2MmI2NmRkZDQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDRhN2UxNzM4MWUxMThhOTQwMDY3NzMyZWFmNjlmODYwYTBl
NjcyNTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQdXJ1c2hvdHRhbSBDaG91ZGhh
cnkgPHB1cnVzaG90dGFtMjcua3VtYXJAbGdlLmNvbT4KIERhdGU6IFR1ZSwgOCBPY3QgMjAyNCAx
MTo0NzoyMSArMDUzMAogU3ViamVjdDogW1BBVENIXSB2cmVuZDogRml4IGludC1jb252ZXJzaW9u
IGZhdGFsIGJ1aWxkIGVycm9yIHdpdGggR0NDLTE0CkBAIC0xOSw3ICsxOSw2IEBAIFVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92
aXJnbHJlbmRlcmVyLy0vCiBTaWduZWQtb2ZmLWJ5OiBQdXJ1c2hvdHRhbSBDaG91ZGhhcnkgPHB1
cnVzaG90dGFtMjcua3VtYXJAbGdlLmNvbT4KIFBhcnQtb2Y6IDxodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci8tL21lcmdlX3JlcXVlc3RzLzE0NDA+CiAt
LS0KLQogIHNyYy92cmVuZF93aW5zeXNfZWdsLmMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKQEAgLTM2LDYgKzM1LDMgQEAgaW5kZXggOWQ5
ZjQxMGMuLjg3NTBmNmIyIDEwMDY0NAogICNlbmRpZgogICAgIH0gZWxzZSB7CiAgI2lmZGVmIEVO
QUJMRV9HQk0KLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXJfMS4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjAuYmIKaW5kZXggODdmMjVhMzQ2MS4uM2EwOTlk
ZDMwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5k
ZXJlci92aXJnbHJlbmRlcmVyXzEuMS4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQx
OGZjYThmODgzMDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFs
L2VnbCB2aXJ0dWFsL2xpYmdibSIKLVNSQ1JFViA9ICI2OTA2ODBlNWYwZjk1MmUyMjQyNGZjYTE1
MzhjMWIyNDQ1N2EwODY4IgorU1JDUkVWID0gIjFhZWFmNWUxMGE5Yzg5MDk2ZTk2ZDA5NTk5YWE0
MTlkNWM1MDcxMmYiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmly
Z2wvdmlyZ2xyZW5kZXJlci5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0
aG9uLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdnJlbmQtRml4LWludC1jb252ZXJz
aW9uLWZhdGFsLWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCBcCi0tIAoyLjQ0LjEKCg==

--===============5696817412474731832==--

